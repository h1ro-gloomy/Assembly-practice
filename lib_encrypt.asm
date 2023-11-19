; Windows Library Encryptor

section .data
    filename db 'example.txt', 0
    key db 'encryptionkey', 0

section .text
    global _start

_start:
    ; Open the file for reading
    mov eax, 5 ; sys_open
    mov ebx, filename
    mov ecx, 0 ; O_RDONLY
    int 0x80

    ; Check if the file was opened successfully
    cmp eax, -1
    je error

    ; Get the file size
    mov ebx, eax ; file descriptor
    mov eax, 19 ; sys_lseek
    xor ecx, ecx ; offset = 0
    xor edx, edx ; whence = SEEK_END
    int 0x80

    ; Store the file size in a variable
    mov esi, eax

    ; Allocate memory for the file content
    mov eax, 192 ; sys_mmap
    xor ebx, ebx ; addr = NULL
    mov ecx, esi ; length = file size
    mov edx, 0x22 ; prot = PROT_READ | PROT_WRITE
    mov esi, 0x02 ; flags = MAP_PRIVATE | MAP_ANONYMOUS
    mov edi, -1 ; fd = -1
    xor ebp, ebp ; offset = 0
    int 0x80

    ; Read the file content into memory
    mov eax, 3 ; sys_read
    mov ebx, ebx ; file descriptor
    mov ecx, eax ; buffer
    mov edx, esi ; count = file size
    int 0x80

    ; Encrypt the file content
    mov esi, eax ; bytes read
    mov edi, key ; encryption key
    xor ecx, ecx ; counter

encrypt_loop:
    mov al, [ecx+edx] ; get a byte from the file content
    xor al, [ecx+edi] ; xor with the encryption key
    mov [ecx+edx], al ; store the encrypted byte back
    inc ecx ; increment the counter
    cmp ecx, esi ; check if all bytes have been encrypted
    jne encrypt_loop

    ; Write the encrypted content back to the file
    mov eax, 4 ; sys_write
    mov ebx, ebx ; file descriptor
    mov ecx, eax ; buffer
    mov edx, esi ; count = bytes read
    int 0x80

    ; Close the file
    mov eax, 6 ; sys_close
    mov ebx, ebx ; file descriptor
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    xor ebx, ebx ; exit code = 0
    int 0x80

error:
    ; Handle the error
    mov eax, 4 ; sys_write
    mov ebx, 2 ; stderr
    mov ecx, error_message
    mov edx, error_message_length
    int 0x80

    ; Exit the program
    mov eax, 1 ; sys_exit
    mov ebx, 1 ; exit code = 1
    int 0x80

section .data
    error_message db 'Error: Failed to open the file', 0
    error_message_length equ $ - error_message
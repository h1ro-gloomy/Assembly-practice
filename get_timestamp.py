import pefile
import os
import time

# Запросить имя файла у пользователя
file_name = input("Введите имя файла: ")

try:
    # Проверить, существует ли указанный файл
    if not os.path.isfile(file_name):
        print("Указанный файл не существует.")
        exit()

    # Открыть указанный файл с помощью pefile
    pe = pefile.PE(file_name)

    # Получить timestamp из заголовка файла
    timestamp = pe.FILE_HEADER.TimeDateStamp

    # Преобразовать timestamp в строку с форматом даты и времени
    timestamp_str = time.strftime("%Y-%m-%d %H:%M:%S", time.localtime(timestamp))

    # Вывести полученное время создания
    print("Время создания файла:", timestamp_str)

except Exception as e:
    print("Произошла ошибка: ", str(e))

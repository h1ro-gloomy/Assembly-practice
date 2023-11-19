import sys
def generate(name):
word = 0
for letter in name:
word += ord(letter)
return word ^ 0x5678 ^ 0x1234

if __name__ == '__main__':
if len(sys.argv) < 2:
print("name")
sys.exit(1)
else:
print(generate(sys.argv[1].upper()))
input('')
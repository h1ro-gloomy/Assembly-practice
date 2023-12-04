import os
import re

def get_floor_number(directory_name):
    match = re.search('этаж (\d+)', directory_name)
    if match:
        return int(match.group(1))
    else:
        return 0

def numerate_files(dir_path, start_number=1580, file_limit_per_dir=7):  #СЮДА ПЕРВЫЙ 
    first_counter = start_number
    remaining_counter = 1741  #СЮДА ОСТАТОК 

    categories = [cat for cat in os.listdir(dir_path) if os.path.isdir(os.path.join(dir_path, cat))]

    categories.sort(key=get_floor_number)

    for cat in categories:
        cat_path = os.path.join(dir_path, cat)
        files = [f for f in os.listdir(cat_path) if os.path.isfile(os.path.join(cat_path, f))]

        for i, f in enumerate(files, start=1):
            if i <= file_limit_per_dir:
                new_file = os.path.join(cat_path, f'{first_counter}.jpg')
                first_counter += 1
            else:
                new_file = os.path.join(cat_path, f'{remaining_counter}.jpg')
                remaining_counter += 1

            old_file = os.path.join(cat_path, f)
            os.rename(old_file, new_file)

numerate_files(r"C:\Users\1\Desktop\nigger")

import os
import re

def get_floor_number(directory_name):
    match = re.search('этаж (\d+)', directory_name)
    if match:
        return int(match.group(1))
    else:
        return 0

def numerate_files(dir_path, start_number=1, file_limit_per_dir=7):
    last_number = start_number

    categories = [cat for cat in os.listdir(dir_path) if os.path.isdir(os.path.join(dir_path, cat))]

    categories.sort(key=get_floor_number)

    for cat in categories:
        cat_path = os.path.join(dir_path, cat)
        files = [f for f in os.listdir(cat_path) if os.path.isfile(os.path.join(cat_path, f))]

        files = files[:file_limit_per_dir]

        for f in files:
            old_file = os.path.join(cat_path, f)
            new_file = os.path.join(cat_path, f'{last_number}.jpg')
            os.rename(old_file, new_file)
            last_number += 1

numerate_files(r"C:\Users\1\Desktop\nigger")
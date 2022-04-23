
from copy import copy
import os
from definitions import ROOT_DIR
import shutil

print(ROOT_DIR)
filepath =os.path.join(ROOT_DIR, 'SEMANTICCBCL', 'fake_Data', 'johanna.txt')

# load list of mmy items
my_file = open(filepath, "r")
content_list = my_file. readlines()

src = os.path.join(ROOT_DIR, 'SEMANTICCBCL', 'isAbout.json')
print(src)
for item in content_list:
    file = item + ".json"
    dst = os.path.join(ROOT_DIR, 'SEMANTICCBCL', 'fake_Data', file)
    print(dst)
    shutil.copy(src, dst)

#print(content_list)
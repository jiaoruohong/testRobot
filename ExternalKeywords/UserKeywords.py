import os


def create_folder(foldername):
    os.mkdir(foldername)


def concatenate_values(val1, val2):
    ans = val1 + "_" + val2
    return ans

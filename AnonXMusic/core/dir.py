import os
import sys
import logging
from os import listdir, mkdir

def dirr():
    downloads_folder = "downloads"
    cache_folder = "cache"
    for file in os.listdir():
        if file.endswith(".jpg") or file.endswith(".jpeg") or file.endswith(".png"):
            os.remove(file)

    if downloads_folder not in listdir():
        mkdir(downloads_folder)

    if cache_folder not in listdir():
        mkdir(cache_folder)

    logging.info("Directories Updated.")

if __name__ == "__main__":
    dirr()

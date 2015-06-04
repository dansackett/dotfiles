#!/usr/bin/env python
import os

HOME = os.path.expanduser('~')
DOTFILES = os.path.dirname(os.path.join(os.getcwd(), __file__))
FILES = [
    '.bashrc',
    '.bash_functions',
    '.bash_aliases',
    '.bash_vars',
    '.bash_python',
    '.bash_mysql',
    '.vimrc',
    '.pythonrc.py',
    '.gtkrc-2.0',
    '.gitconfig',
    '.vim',
    '.config/terminator/config',
    '.virtualenvs/postactivate',
    '.virtualenvs/postdeactivate',
    '.virtualenvs/postmkvirtualenv',
    '.virtualenvs/predeactivate',
    '.virtualenvs/prermvirtualenv',
]


def make_directories(file):
    """If we have directories, create them recursively ignoring the file name"""
    if '/' in file:
        directories = '/'.join(file.split('/')[:-1])

        try:
            os.makedirs(os.path.join(HOME, directories))
        except:
            pass


def file_exists(file):
    """Check if the file exists on the HOME path"""
    if os.path.exists(os.path.join(HOME, file)):
        return '{0} already exists. Would you like to overwrite it? (y, n): '

    return


def create_symlink(file):
    """Build Symlink"""
    exists = file_exists(file)

    make_directories(file)

    if exists:
        choice = raw_input(exists.format(file))

        if not choice.lower() is 'y':
            return
        else:
            os.remove(os.path.join(HOME, file))

    os.symlink(os.path.join(DOTFILES, file), os.path.join(HOME, file))


def main():
    """Run our program"""
    for file in FILES:
        create_symlink(file)


if __name__ == '__main__':
    main()

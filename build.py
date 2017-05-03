#!/usr/bin/env python
from __future__ import print_function

import os

FILES = [
    '.bashrc',
    '.bash_functions',
    '.bash_aliases',
    '.bash_vars',
    '.bash_python',
    '.bash_profile',
    '.vimrc',
    '.pythonrc.py',
    '.gtkrc-2.0',
    '.gitconfig',
    '.vim',
    '.tmux.conf',
    '.config/terminator/config',
    '.virtualenvs/postactivate',
    '.virtualenvs/postdeactivate',
    '.virtualenvs/postmkvirtualenv',
    '.virtualenvs/predeactivate',
    '.virtualenvs/prermvirtualenv',
    'tunnel.sh',
]

if __name__ == '__main__':
    home_dir = os.path.expanduser('~')
    dotfiles_dir = os.path.dirname(os.path.join(os.getcwd(), __file__))

    for filename in FILES:
        print('Creating symlink for %s' % filename)

        home_file_path = os.path.join(home_dir, filename)
        dotfiles_file_path = os.path.join(dotfiles_dir, filename)

        # Remove any existing symlinks
        if os.path.exists(home_file_path):
            os.remove(home_file_path)

        # Attempt to create directories reursively. It throws an exception if
        # the path already exists
        if '/' in filename:
            try:
                directories = '/'.join(filename.split('/')[:-1])
                os.makedirs(os.path.join(home_dir, directories))
            except:
                pass

        # Symlink that file
        os.symlink(dotfiles_file_path, home_file_path)

    print('Done!')

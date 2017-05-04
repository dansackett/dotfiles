# My Dotfiles

A place to hold all of my dotfiles for when I start on a new computer or want to see my defaults.

## Automating Build

In order to install the dotfiles into your home directory, a Python script is
supplied. It will create symlinks for each relevant dot files and also create
the directories it needs for nested config items. You can do this by running:

```
python build.py
```

## Configuring Vim

My .vimrc uses [vim-plug](https://github.com/junegunn/vim-plug) plugins. You
will need to install vim-plug and run the installer to have Vim work as expected:

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall
```

## Additional Dependencies

I have [direnv](https://direnv.net/) as part of my local workstation. You
should install direnv or remove the declaration in the .bashrc to avoid seeing
warnings.

I also have [fzf](https://github.com/junegunn/fzf) and
[the silver searcher](https://github.com/ggreer/the_silver_searcher) setup to
make search super fast and more fuzzy in the filesystem.

I also have a fun Golang gopher who says Ernest Hemmingway quotes. You can get
it from [https://github.com/dansackett/gophersay](https://github.com/dansackett/gophersay).

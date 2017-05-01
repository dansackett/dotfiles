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

My .vimrc uses [Vundle](https://github.com/VundleVim/Vundle.vim) plugins. You
will need to install Vundle and run the installer to have Vim work as expected:

```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```

## Additional Dependencies

I have [direnv](https://direnv.net/) as part of my local workstation. You
should install direnv or remove the declaration in the .bashrc to avoid seeing
warnings.

I also have a fun Golang gopher who says Ernest Hemmingway quotes. You can get
it from [https://github.com/dansackett/gophersay](https://github.com/dansackett/gophersay).

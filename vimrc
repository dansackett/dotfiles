" break with the busted old vi junk
" must be first
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" vundle stuff
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" vundle repo
Bundle 'gmarik/vundle'

" github repos
Bundle 'vim-scripts/bufkill.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'roman/golden-ratio'
Bundle 'klen/python-mode'
Bundle 'Townk/vim-autoclose'
Bundle 'tpope/vim-commentary'
Bundle 'groenewege/vim-less'
Bundle 'tpope/vim-surround'
Bundle 'mattn/zencoding-vim'

" python mode
let g:pymode_lint_checker = "pylint,pyflakes,pep8,mccabe"
let g:pymode_lint_cwindow = 0
let g:pymode_virtualenv = 1
let g:pymode_breakpoint_key = '<leader>d'

" custom file ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ }

" LESS Syntax
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>


""""""""""""""""""""""""""""""""""""""""
" General VIM
""""""""""""""""""""""""""""""""""""""""

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" show line numbers
set number

" show lines in lower right
set ruler

" don't wrap lines ever
set nowrap

" Set to auto read when a file is changed from the outside
set autoread

" global text columns
set textwidth=78

" don't automatically break long lines unless they are new
set formatoptions+=l

" detect file type, turn on that type's plugins and indent preferences
filetype plugin indent on

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" allow background buffers
set hidden

" global tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" ignore these nonsense files
set wildignore=*.swp,*.bak,*.pyc,*.class

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" Remember info about open buffers on close
set viminfo^=%

" no backups, please!
set nobackup
set noswapfile

" keep a longer history
set history=1000

" enable folding
set foldmethod=indent
set foldlevel=99

" make file/command tab completion useful
set wildmode=list:longest

" clipboard fusion!
set clipboard^=unnamed clipboard^=unnamedplus

" Source the vimrc file after saving it.
" This way, you don't have to reload Vim to see the changes.
if has("autocmd")
 augroup myvimrchooks
  au!
  autocmd bufwritepost .vimrc source ~/.vimrc
 augroup END
endif


""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

" set leader
let mapleader = ","

" switch between files
nnoremap <leader><leader> <c-^>

" easier window navigation
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" Remap VIM 0 to first non-blank character
map 0 ^

" set jj to exit insert mode
imap jj <Esc>

" reselect when indenting
vnoremap < <gv
vnoremap > >gv

" ctrlp commands
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>f :CtrlPClearCache<cr>

" build bundles
nnoremap <leader>i :BundleInstall


""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""

" show search matches as you type
set incsearch

" clear the search buffer when hitting return
nnoremap <CR> :nohlsearch<cr>

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" highlight search results
set hlsearch

""""""""""""""""""""""""""""""""""""""""
" Aestehtics
""""""""""""""""""""""""""""""""""""""""

" keep cursor somewhat centered
set scrolloff=25

" highlight current line
:set cursorline

" remove gVim gui
:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar

" invert and bold status line
set highlight=sbr

" enable syntax highlighting
syntax on

"tell the term has 256 colors
set t_Co=256

colorscheme lucius
set guitablabel=%M%t
set lines=40
set columns=115
set guifont=Inconsolata\ Medium\ 10

" enable display of invisible characters
set list

" use the same symbols as textmate for tabs and eols
set listchars=tab:▸\ ,eol:¬

" invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" highlight col 80
set colorcolumn=80
highlight ColorColumn guibg=gray16
highlight ColorColumn ctermbg=Black

" extra whitespace sucks
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

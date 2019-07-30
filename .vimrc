" break with the busted old vi junk
" must be first
set nocompatible
filetype off

""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""

" vim-plug
call plug#begin('~/.vim/plugged')

" productivity
Plug 'ervandew/supertab'
Plug 'Valloric/YouCompleteMe'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'vim-scripts/bufkill.vim'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'bling/vim-airline'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

" misc
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/gitignore'

" language specific
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'pangloss/vim-javascript'
Plug 'hail2u/vim-css3-syntax'
Plug 'plasticboy/vim-markdown'
Plug 'saltstack/salt-vim'
Plug 'rust-lang/rust.vim'
Plug 'jwalton512/vim-blade'
Plug 'mxw/vim-jsx'
Plug 'w0rp/ale'

" Enable project specifc .vimrc files
Plug 'embear/vim-localvimrc'

call plug#end()            " required
filetype plugin indent on    " required

" python pylinter
" set makeprg=pylint\ --reports=n\ --output-format=parseable\ %:p
" set errorformat=%f:%l:\ %m
" autocmd BufWritePost *.py make

" custom file ignores
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\.git$\|\.hg$\|\.svn$\|bower_components$\|dist$\|node_modules$\|project_files$\|test$',
    \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" LESS Syntax
nnoremap ,m :w <BAR> !lessc % > %:t:r.css<CR><space>

" Airline show
set laststatus=2

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<c-j>"
let g:UltiSnipsJumpBackwardTrigger = "<c-k>"

" vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_auto_type_info = 1
"let g:go_auto_sameids = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
let g:go_list_type = "quickfix"
set updatetime=100 " updates :GoInfo faster

let g:ycm_gocode_binary_path = "$GOPATH/bin/gocode"
let g:ycm_godef_binary_path = "$GOPATH/bin/godef"

" ale
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_fixers = {
\  'javascript': ['eslint'],
\}

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

" don't automatically break long lines unless they are new
set formatoptions+=l

" detect file type, turn on that type's plugins and indent preferences
filetype plugin on
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
set expandtab
set smarttab
set fileformat=unix
set tabstop=4
set softtabstop=4
set shiftwidth=4

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

" No arrow keys!
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" Relative numbers by default
set relativenumber

" Toggle relative line numbers
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" Automatically set absolute numbers in insert mode
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""

" set leader
let mapleader = ","

" Easily switch between line number styles
nnoremap <leader>n :call NumberToggle()<cr>

" switch between files with <leader><leader>
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

" Map ,g to tag definition
map <leader>g g]

" reselect when indenting
vnoremap < <gv
vnoremap > >gv

" ctrlp commands
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>f :CtrlPClearCache<cr>

" build bundles
nnoremap <leader>i :BundleInstall

" /// for vim-commentary
nmap /// <Plug>CommentaryLine

" shortcut to save files that are in READONLY mode easily
cmap w!! w !sudo tee % >/dev/null

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
" Aesthetics
""""""""""""""""""""""""""""""""""""""""

" keep cursor somewhat centered
set scrolloff=3

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

set background=dark
colorscheme jellybeans

set guitablabel=%M%t
if has("gui_running")
    set lines=40
    set columns=115
endif
set guifont=Inconsolata\ Medium\ 10

" highlight col 80
set colorcolumn=80

" extra whitespace sucks, make it RED
" highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/

" Force unsafe commands not to run
set secure

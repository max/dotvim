set nocompatible                " screw vi-compatible features
set encoding=utf-8              " utf-8 is fun

call pathogen#infect()          " pathogen
source ~/.vim/filetypes         " load awesome filetypes
runtime macros/matchit.vim      " load matchit (included with vim)

set hidden                      " don't yell when hiding modified buffers
set history=1000                " lots o' history
set clipboard=unnamed           " link vim and the system's clipboards
set visualbell                  " no beeping!
set scrolloff=3                 " keep a few lines visible above and below cursor
set number                      " show line numbers
set nowrap                      " don't wrap line by default
set backupdir=~/.vim/_backup//  " store backup files
set directory=~/.vim/_tmp//     " store swap files
set undodir=~/.vim/_undo        " store undo history
set undofile
set undolevels=1000
set undoreload=10000
set splitbelow                  " I like my splits opening below
set splitright                  " and my vsplits opening to the right

set autoread                    " load file when changed outside of Vim

set showcmd                     " show partial commands below status line
set cmdheight=2                 " 2-line command window
set textwidth=80                " break long lines at 80 characters

""" Searching
set hlsearch                    " highlight search results
set incsearch                   " highlight matches while searching
set ignorecase                  " ignore case when searching
set smartcase                   " override ignorecase if search contains upper case

""" Whitespace
set shiftwidth=2                " use 2 spaces for indentation
set tabstop=2                   " use 2 spaces when tabbinb
set expandtab                   " use spaces instead of tabs because tabs are evil
set smarttab                    " backspacing deletes space-expanded tabs
set nojoinspaces                " never use two spaces when joining lines
set backspace=indent,eol,start  " allow backspacing over autoindent,
                                " line breaks, and start of insert

""" Tab completion
set wildmenu
set wildmode=list:full,full
set wildignore+=*/tmp/*,*.so,*.swp

""" Code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1000

""" Show invisible characters
set listchars=""                " reset the listchars
set listchars+=tab:\ \          " show tab as two spaces
set listchars+=trail:.          " show trailing whitespace as .
set listchars+=extends:>        " the character to show in the last column when
                                " wrap is off and line is too long.
set listchars+=precedes:<       " the character to show in the first column when
                                " wrap is off and line is too long.

""" Visual
syntax on                       " highlight my syntax plz
set t_Co=256                    " more than 8 colors, kthx
set background=dark             " set the background color
colorscheme base16-default

if has('gui_running')
  set guifont=Menlo:h16         " set font and font size
endif

""" Status bar
set laststatus=2
" set statusline=\ %f%(\ [%M%R%W%H]%)       " filename
" set statusline+=%=                        " right align
" set statusline+=%-14.(%l/%L,%v%)\ %<%P\   " offset

" Set window/terminal title
set title
set titlestring=%F                        " /path/to/file.txt (Vim)

""" Plugin Configuration

autocmd FileType html,eruby let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,eruby source ~/.vim/bundle/closetag/plugin/closetag.vim

""" Mappings
let mapleader = ","

" delete the active buffer keeping the split open
map <leader>x :bprevious<cr>:bdelete #<cr>
map <leader>X :bdelete<cr>

nmap <leader>hs :set hlsearch! hlsearch?<CR>
nmap <leader>a :Ack!<space>
nmap <leader>n :NERDTreeToggle<CR>

nmap <leader>s :%s/\<<C-r><C-w>\>/

augroup Vim
  autocmd!

  " remove trailing whitespace on save
  autocmd BufWritePre * :%s/\s\+$//e

  " reload vimrc after save
  autocmd BufWritePost $MYVIMRC source $MYVIMRC

  " create the directory if it doesn't exist
  autocmd BufNewFile * silent !mkdir -p $(dirname %)
augroup END

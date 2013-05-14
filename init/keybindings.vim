""" Mappings
let mapleader = ","

" delete the active buffer keeping the split open
map <leader>x :bprevious<cr>:bdelete #<cr>
map <leader>X :bdelete<cr>

nmap <leader>hs :set hlsearch! hlsearch?<CR>
nmap <leader>a :Ack!<space>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader><leader> :ZoomWin<cr>

nmap <leader>s :%s/\<<C-r><C-w>\>/

" buffer navigation
nmap <c-h> <c-w>h
nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-l> <c-w>l

" open file in Marked
map <leader>m :silent !open % -a /Applications/Marked.app<cr>:redraw!<cr>

set hlsearch " highlight search
set shiftwidth=4 " autoindend width
set autoindent " indent a new line the same amount as the line just typed
filetype plugin indent on
syntax on
set scrolloff=3 " always display lines below the cursor 

" absolute linenumber on insert mode, relative otherwise
:set number
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END



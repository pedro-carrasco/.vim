filetype off
syntax on

filetype plugin indent on 

set modelines=0

set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

let mapleader=","
set encoding=utf-8
set hid

set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set matchpairs+=<:>

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

set showmode
set showcmd

inoremap jk <ESC>

set encoding=utf-8
set ruler
set cmdheight=2

set showmatch

" Show line number
set nu

" Ignore case when searching
set ignorecase
set incsearch
set hlsearch
set smartcase

" Set magic on
set magic
" show matching bracets
set showmatch
set showfulltag

set packpath+=~/.vim/pack/

"Vim-plug install and load plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'vimwiki/vimwiki'
Plug 'vim-airline/vim-airline'


"NERDTree config
map <C-n> :NERDTreeToggle<CR>

"vimwiki config
let g:vimwiki_list = [{'path': '~/OneDrive/Documents/wiki',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

function! ToggleCalendar()
  execute ":Calendar"
  if exists("g:calendar_open")
    if g:calendar_open == 1
      execute "q"
      unlet g:calendar_open
    else
      g:calendar_open = 1
    end
  else
    let g:calendar_open = 1
   end
endfunction
:autocmd FileType vimwiki map <leader>c :call ToggleCalendar()<CR>
:autocmd FileType vimwiki map <leader>s :VimwikiSearch /
:autocmd FileType vimwiki map <leader>dg :VimwikiDiaryGenerateLinks<CR>
:autocmd FileType vimwiki map <leader>di :VimwikiDiaryIndex<CR>

au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template.py '%'

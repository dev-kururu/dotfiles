set nocompatible

if has("syntax")
  syntax on
end

filetype plugin indent on

set autoindent

set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

set hlsearch
set incsearch
set ignorecase
set smartcase

set autoread

set mouse=a

set enc=utf-8
set fencs=utf-8
lang en_US.UTF-8
set fileformats=unix,dos,mac

set history=9999

set nobackup
set noswapfile
if has("persistent_undo")
   let target_path = expand('~/.cache/nvim/undo/')

  if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
  endif

  let &undodir=target_path
  set undofile
endif

set backspace=2

set hidden

set noerrorbells

set scrolloff=8
au TermEnter * setlocal scrolloff=0
au TermLeave * setlocal scrolloff=8

set showcmd
set wildmenu
set noshowmode

set termguicolors

set number
set relativenumber

set signcolumn=yes:1

set listchars=tab:→\ ,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:·
set showbreak=↪
" set list

set updatetime=100

let g:netrw_banner = 0

" remember cusor postion
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" remember code fold
set viewoptions-=options
augroup remember_folds
  autocmd!
  autocmd BufWinLeave *.* mkview
  autocmd BufWinEnter *.* silent! loadview
augroup END

for char in [ '_', '.', ':', ',', ';', '<bar>', '/', '<bslash>', '*', '+', '%', '-', '#' ]
    execute 'xnoremap i' . char . ' :<C-u>normal! T' . char . 'vt' . char . '<CR>'
    execute 'onoremap i' . char . ' :normal vi' . char . '<CR>'
    execute 'xnoremap a' . char . ' :<C-u>normal! F' . char . 'vf' . char . '<CR>'
    execute 'onoremap a' . char . ' :normal va' . char . '<CR>'
endfor

" add custome file type
autocmd BufNewFile,BufRead *.msg set filetype=message

" vim visual star search
xnoremap * :<C-u>call <SID>VisualSetSearch('/')<CR>/<C-R>=@/<CR><CR>
function! s:VisualSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

" format options off!!
augroup format_options
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

" Color Set
set t_Co=256

" set theme gruvbox
let g:gruvbox_termcolors=256
let g:gruvbox_improved_warnings = 1
let g:gruvbox_transparent_bg=1
colorscheme gruvbox
set background=dark

set colorcolumn=81
highlight ColorColumn cterm=NONE ctermbg=236 ctermfg=red guibg=#3c3839 guifg=#ff0000

if !&diff
  set cursorline
endif
highlight CursorLine cterm=NONE ctermbg=235 guibg=#3c3839

highlight GitGutterAdd    ctermfg=2 guifg=#00ff00
highlight GitGutterChange ctermfg=3 guifg=#ffff00
highlight GitGutterDelete ctermfg=1 guifg=#ff0000
highlight BookmarkSign    ctermbg=NONE ctermfg=160 guibg=NONE guifg=#ff0000
highlight BookmarkLine    ctermbg=255  ctermfg=235 guibg=#ffffff guifg=#000000

" status bar
set statusline=
set statusline+=\ %R                                       "Readonly or not
set statusline+=%m                                         "Modified
set statusline+=\ %F                                       "File full path
set statusline+=\ %l:%c                                    "Line:Col Number
set statusline+=\ %p%%\                                    "Row Percentage
set statusline+=%=                                         "Right side
set statusline+=\ %Y\ \|                                   "File type
set statusline+=\ %{&fileencoding?&fileencoding:&encoding} "Encoding
set statusline+=\[%{&fileformat}\]\ \|                     "Encoding2
set statusline+=\ %04B                                     "Char info
set statusline+=\ 


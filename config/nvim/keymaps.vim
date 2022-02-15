"! Key Mapping
let mapleader=" "

nnoremap <SPACE> <Nop>

nnoremap <silent> <leader><ENTER> :Marks<CR>

nnoremap <leader><SPACE> :
inoremap <silent><expr> <c-space> coc#refresh()

" Go to last edit file
noremap <leader>` <C-^>

" <q> - Quick & Macro
nnoremap <silent> Q <nop>
nnoremap <C-q> :Snippets<CR>
inoremap <C-q> <ESC>:Snippets<CR>

" <w> - Window
nnoremap <silent> <leader>wq <C-w>q
nmap <silent> <leader>ww <Plug>(choosewin)
nnoremap <silent> <leader>wr :WinResizerStartResize<CR>
nnoremap <silent> <leader>wo :only<CR>
nnoremap <silent> <leader>wh <C-w>h
nnoremap <silent> <leader>wj <C-w>j
nnoremap <silent> <leader>wk <C-w>k
nnoremap <silent> <leader>wl <C-w>l
nnoremap <silent> <leader>ws <C-w>s<C-w>j
nnoremap <silent> <leader>wv <C-w>v<C-w>l

" <e> - Error
" Like emacs
inoremap <C-e> <End>

" <r> Refactor & Reload
" Reload
nnoremap <leader>R :source ~/.config/nvim/init.vim<CR>
" Refactor
nnoremap <leader>rr :Neoformat<CR>
" Whitespace
nnoremap <leader>rw :call StripTrailingWhitespace()<CR>
" reName
nmap <leader>rn <Plug>(coc-rename)

" <t> - Toggle
" Wrap
nnoremap <silent> <leader>tw :set wrap!<CR>
" Indednt guide
nnoremap <silent> <leader>ti :IndentGuidesToggle<CR>
" List(show whitespace)
nnoremap <silent> <leader>tl :set list!<CR>
" Blame
nnoremap <silent> <leader>tb :BlamerToggle<CR>
" Fullscreen
nnoremap <silent> <leader>tf :call MaximizeToggle()<CR>
" Highlight
nnoremap <silent> <leader>th :nohl<CR>
" Spell check
nnoremap <silent> <leader>ts :set spell! spelllang=en_us<CR>

" <y> - Yank
nnoremap Y y$
nnoremap <C-y> y^
nnoremap <leader>Y "+y$
nnoremap <leader><C-y> "+y^
nnoremap <leader>y "+y
vnoremap <leader>y "+y

" <u> - UltiSnips
" UltiSnips
nnoremap <silent> <leader>uu :Snippets<CR>
nnoremap <silent> <leader>ue :UltiSnipsEdit<cr>

" <i> - Insert
" Path Relative
nnoremap <silent> <leader>ipr :put=@%<CR>
" Path Absolute
nnoremap <silent> <leader>ipa :put=expand('%:p')<CR>
" Name Directory
nnoremap <silent> <leader>ind :put=expand('%:p:h:t')<CR>
" Name File
nnoremap <silent> <leader>inf :put=expand('%:t')<CR>
" UltiSnips
nnoremap <silent> <leader>iu :Snippets<CR>

" <o> - Open
if has("mac")
  nnoremap <silent> <leader>oo :!open ./<CR>
endif

" <p> - Paste & Open File
nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <C-p> :GFiles<CR>

" <[>
nnoremap <silent><leader>[ :bprevious<CR>

" <]>
nnoremap <silent><leader>] :bnext<CR>

" <a> - All
inoremap <C-a> <Home>
nnoremap <leader>a ggVG

" <s> - Search
nnoremap s <Nop>

nnoremap <silent> <C-s> :Lines<CR>
inoremap <silent> <C-s> <ESC>:Lines<CR>
vnoremap <silent> <C-s> y:Lines <C-r>0<CR>

nmap <silent> sf <Plug>(easymotion-bd-fl)
vmap <silent> sf <Plug>(easymotion-bd-fl)
nmap <silent> ss <Plug>(easymotion-bd-f2)
vmap <silent> ss <Plug>(easymotion-bd-f2)
nmap <silent> sn <Plug>(easymotion-f2)
vmap <silent> sn <Plug>(easymotion-f2)
nmap <silent> sp <Plug>(easymotion-F2)
vmap <silent> sp <Plug>(easymotion-F2)

nmap <silent> sh <Plug>(easymotion-bl)
vmap <silent> sh <Plug>(easymotion-bl)
nmap <silent> sk <Plug>(easymotion-k)
vmap <silent> sk <Plug>(easymotion-k)
nmap <silent> sj <Plug>(easymotion-j)
vmap <silent> sj <Plug>(easymotion-j)
nmap <silent> sl <Plug>(easymotion-wl)
vmap <silent> sl <Plug>(easymotion-wl)

nmap <silent> s. <Plug>(easymotion-repeat)
vmap <silent> s. <Plug>(easymotion-repeat)

" <d> - TODO Debug

" <f> - Find files
nnoremap <silent> <leader>ff :Files<Cr>
nnoremap <silent> <leader>fp :GFiles<CR>
nnoremap <silent> <leader>fr :History<CR>
nnoremap <silent> <leader>fs :Rg<CR>
nnoremap <silent> <leader>f, :e ~/.config/dotfiles/config/nvim/init.vim<CR>

" <g> - Git & Goto
" Go to Class
nnoremap <silent> gc <Plug>(coc-declaration)
" Go to Definition
nnoremap <silent> gd <Plug>(coc-definition)
" Go to Implementation
nnoremap <silent> gi <Plug>(coc-implementation)
" Go to References
nnoremap <silent> gr <Plug>(coc-references)
" Go Type Definition
nnoremap <silent> gy <Plug>(coc-type-definition)

nnoremap <leader>gg :G<CR>
nnoremap <leader>g[ :GitGutterPrevHunk<CR>
nnoremap <leader>g] :GitGutterNextHunk<CR>

" <h> <Move Fast>
nnoremap <leader>h ^
vnoremap <leader>h ^

" <j> <Move Fast>
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <C-j> i<CR><ESC>
nnoremap <leader>j 7j
vnoremap <leader>j 7j

vnoremap J :m '>+1<CR>gv=gv
nnoremap J mzJ`z

" <k> <Move Fast>
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <leader>k 7k
vnoremap <leader>k 7k

vnoremap K :m '<-2<CR>gv=gv

" <l> <Move Fast>
nnoremap <leader>l $
vnoremap <leader>l $

" <;> <Command>
nnoremap <leader>; :
vnoremap <leader>; :

" <'> <??>

" <\> <Rg>
nnoremap \ :Rg<CR>

" <z> <??>

" <x> - Run
nnoremap x "_x
vnoremap x "_x
" All
nmap <leader>xx <plug>(fzf-maps-n)
xmap <leader>xx <plug>(fzf-maps-x)
omap <leader>xx <plug>(fzf-maps-o)

" Run
augroup runfile
  autocmd!
  autocmd FileType go          nnoremap <leader>xf :w<CR>:GoRun<CR>
  autocmd FileType html        nnoremap <leader>xf :w<CR>:exec ':silent !$BROWSER %'<CR>
  autocmd FileType javascript  nnoremap <leader>xf :w<CR>:exec '!clear; node' shellescape(@%, 1)<CR>
  autocmd FileType typescript  nnoremap <leader>xf :w<CR>:exec '!clear; ts-node' shellescape(@%, 1)<CR>
  autocmd FileType python      nnoremap <leader>xf :w<CR>:exec '!clear; python3' shellescape(@%, 1)<CR>
  autocmd FileType ruby        nnoremap <leader>xf :w<CR>:exec '!clear; ruby' shellescape(@%, 1)<CR>
augroup END

" Lint
nnoremap <leader>xl :Neoformat<CR>

" Test
augroup runtest
  autocmd!
  autocmd FileType ruby nnoremap <leader>xt :w<CR>:exec '!clear; rspec' shellescape(@%, 1)<CR>
augroup END

" Import
nnoremap <leader>xi :call CocAction('runCommand', 'editor.action.organizeImport')<cr>

" <c> - Copy & Comment
" Name File
nnoremap <silent> <leader>cnf :let @*=expand("%:t")<CR>
" Directory name only
nnoremap <silent> <leader>cnd :let @*=expand("%:p:h:t")<CR>
" Path Absolute
nnoremap <silent> <leader>cpa :let @*=expand("%:p")<CR>
" Path absolute With Line number
nnoremap <silent> <leader>cpl :let @+=expand("%:p") . ':' . line(".")<CR>

" NERDCommenterComment
nmap <silent> <leader>cc <Plug>NERDCommenterComment
vmap <silent> <leader>cc <Plug>NERDCommenterComment
" NERDCommenterToggle
nmap <silent> <leader>c<space> <Plug>NERDCommenterToggle
vmap <silent> <leader>c<space> <Plug>NERDCommenterToggle

" <v> <Vimwiki>
let g:vimwiki_map_prefix = '<Leader>v'
" Vimwiki Index
nmap <leader>vv <Plug>VimwikiIndex
" Vimwik Diary
nmap <leader>vi <Plug>VimwikiDiaryIndex
" Generate Vimwiki Diary
nmap <leader>v<leader>v <Plug>VimwikiMakeDiaryNote
" Generate Vimwiki Diary Index
nmap <leader>v<leader>i <Plug>VimwikiDiaryGenerateLinks
" Generate Vimwiki Table
nmap <leader>vt :VimwikiTable<CR>

" <b> <Buffer>
" Buffers
nnoremap <silent> <leader>bb :Buffers<cr>
" Quit
nnoremap <silent> <leader>bq :bdelete<CR>
" Only
nnoremap <silent> <leader>bo :BufOnly<CR>
" New
nnoremap <silent> <leader>bn :enew<cr>
" Save
nnoremap <silent> <leader>bs :w<CR>
nnoremap <silent> <leader>bS :wa<CR>

" <n> <???>
nnoremap <silent> n nzzzv
nnoremap <silent> N Nzzzv

" <m> <Bookmarks>
" Show All
nmap <silent> <leader>ma <Plug>BookmarkShowAll
" Clear All
nmap <silent> <leader>mc <Plug>BookmarkClearAll
" Edit Memo
nmap <silent> <leader>me <Plug>BookmarkAnnotate
" Toggle
nmap <silent> <leader>mm <Plug>BookmarkToggle
" Next
nmap <silent> <leader>m] <Plug>BookmarkNext
" Previous
nmap <silent> <leader>m[ <Plug>BookmarkPrev

" <,> <Buffer>
inoremap , ,<C-g>u
nnoremap <silent> <leader>, :Buffers<cr>

" <.> <Netrw>
inoremap . .<C-g>u
nnoremap <leader>. :Explore<CR>

" </> <??>
inoremap ? ?<C-g>u

" <1>
inoremap ! !<C-g>u

" <2>

" <3>

" <4>

" <5>

" <6>

" <7>

" <8>
nnoremap <silent> * *zz

" <9>

" <0>

" <->

" <=>

" <F1> - Help
nnoremap <F1> :h <C-r>=expand("<cword>")<CR>
vnoremap <F1> y :h <C-r>0

" <F2> - Nerdtree
nnoremap <silent> <F2> :NERDTreeToggle<CR>
nnoremap <silent> <leader><F2> :NERDTreeFind<CR>

" <F3> - Todo
nnoremap <silent> <F3> :Lines TODO<CR>

" <F4> - UltiSnips
nnoremap <silent> <F4> :UltiSnipsEdit<cr>

" <F5>

" <F6> - Git
nnoremap <silent> <F6> :G<cr><C-w>o

" <F7> - Error list
nnoremap <silent> <F7> :call ToggleQuickFix()<cr><C-w>k

" <F8> - Structure
nnoremap <silent> <F8> :CocList outline<cr>

" <F9> - Home
nnoremap <silent> <F9> :Startify<CR>

" <F10> - Undotree
nnoremap <silent> <F10> :UndotreeToggle<CR>

" <F11> - Focus
nnoremap <silent> <F11> :Goyo<cr>

" <F12> - Terminal
nnoremap <F12> <C-z>

" <function>
function! ToggleQuickFix()
  if empty(filter(getwininfo(), 'v:val.quickfix'))
    lopen 5
  else
    lclose
  endif
endfunction

command BufOnly silent! execute "%bd|e#|bd#"

function StripTrailingWhitespace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<cr>
    normal `z
  endif
endfunction

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

function! Preserve(command)
    " Save the last search.
    let search = @/
    " Save the current cursor position.
    let cursor_position = getpos('.')
    " Save the current window position.
    normal! H
    let window_position = getpos('.')
    call setpos('.', cursor_position)
    " Execute the command.
    execute a:command
    " Restore the last search.
    let @/ = search
    " Restore the previous window position.
    call setpos('.', window_position)
    normal! zt
    " Restore the previous cursor position.
    call setpos('.', cursor_position)
endfunction

function! GrepToList(re)
  cexpr []
  execute 'silent! noautocmd bufdo vimgrepadd /' . a:re . '/j %'
  cw
endfunction

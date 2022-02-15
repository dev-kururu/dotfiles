" Plugins Section

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
  " 문법 Syntax
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'

  " 자동완성 Autocomplete
  Plug 'SirVer/ultisnips'

  " 작성 Write
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'preservim/nerdcommenter'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tommcdo/vim-lion'
  Plug 'tpope/vim-abolish'

  " 포맷 Format
  Plug 'sbdchd/neoformat'

  " 탐색 Find
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mattesgroeger/vim-bookmarks'
  Plug 'preservim/nerdtree'

  " 검색 Search
  Plug 'easymotion/vim-easymotion'

  " 깃 Git
  Plug 'airblade/vim-gitgutter'
  Plug 'APZelos/blamer.nvim'
  Plug 'tpope/vim-fugitive'

  " Utils
  Plug 'vimwiki/vimwiki', { 'branch': 'dev' }
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/goyo.vim'
  Plug 'mbbill/undotree'
  Plug 't9md/vim-choosewin'

  " Color
  Plug 'morhetz/gruvbox'
  Plug 'ap/vim-css-color'
  Plug 'kien/rainbow_parentheses.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'machakann/vim-highlightedyank'
  Plug 'ryanoasis/vim-devicons'
  Plug 'ntpeters/vim-better-whitespace'
call plug#end()

" plugin name: ale
let g:ale_sign_column_always = 1
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
highlight clear ALEErrorSign
highlight clear ALEWarningSign

let g:ale_linter_aliases = {
      \ 'html': ['html', 'css', 'javascript']
      \}

let g:ale_linters = {
      \   'html': ['htmlhint', 'csslint', 'eslint'],
      \   'css': ['csslint'],
      \   'javascript': ['eslint'],
      \}

" plugin name: coc
function! InstallCocPlugins()
    CocInstall coc-css
    CocInstall coc-go
    CocInstall coc-html
    CocInstall coc-java
    CocInstall coc-lists
    CocInstall coc-pyright
    CocInstall coc-sh
    CocInstall coc-snippets
    CocInstall coc-solargraph
    CocInstall coc-tsserver
    CocInstall coc-ultisnips
endfunction

" plugin name: nerdcommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDDefaultAlign = 'left'
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1

" plugin name: easymotion
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" plugin name: startify
let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']       },
      \ ]

let g:startify_bookmarks = [
            \ { 'wiki': '~/Documents/wiki/index.md' },
            \ { 'dot': '~/.config/dotfiles/' },
            \ ]

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_delete_buffers = 1
let g:startify_session_autoload = 1
let g:startify_fortune_use_unicode = 1
" Automatically Update Sessions
let g:startify_session_persistence = 1
" Remove empty buffer after quit
let g:startify_enable_special = 1

" plugin name: ultisnips
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.local/share/snippets/ultisnips']

" resolve when insert mode keyon function freeeze
if has('nvim')
    au VimEnter * if exists('#UltiSnips_AutoTrigger')
        \ |     exe 'au! UltiSnips_AutoTrigger'
        \ |     aug! UltiSnips_AutoTrigger
        \ | endif
endif

" plugin name: vim-bookmarks
let g:bookmark_highlight_lines = 1
let g:bookmark_no_default_key_mappings = 1
let g:bookmark_auto_save_file = $HOME ."/.cache/nvim/.vim-bookmarks"

" plugin name: vim-gutter
let g:gitgutter_map_keys=0
let g:gitgutter_set_sign_backgrounds = 1

" plugin name: vim-highlightedyank
let g:highlightedyank_highlight_duration = 200
highlight HighlightedyankRegion cterm=reverse gui=reverse

" plugin name: vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

" plugin name: nerdtree
let NERDTreeQuitOnOpen=1

" plugin name: vim-wiki
" rep: https://github.com/johngrib/dotfiles
let g:vimwiki_list = [
    \{
    \   'path': '~/Documents/wiki/',
    \   'syntax' : 'markdown',
    \   'ext' : '.md',
    \   'diary_rel_path': './today',
    \},
\]

let g:auto_template_list = [
    \{
    \   'path': '~/Documents/wiki/',
    \},
\]

" set conceallevel
let g:vimwiki_conceallevel = 0
let g:indentLine_conceallevel = 0
let g:vimwiki_global_ext = 0

" disable table shortcut
let g:vimwiki_table_mappings=0

" disable auto fold
let g:vimwiki_folding = 'custom'

augroup vimwikiauto
    " <C-s> move table column to right
    autocmd FileType vimwiki inoremap <C-s> <C-r>=vimwiki#tbl#kbd_tab()<CR>
    " <C-a> move table column to left
    autocmd FileType vimwiki inoremap <C-a> <Left><C-r>=vimwiki#tbl#kbd_shift_tab()<CR>
augroup END

autocmd FileType vimwiki nnoremap <C-h> :VimwikiGoBackLink<CR>

let g:md_modify_disabled = 0

function! LastModified()
    if g:md_modify_disabled
        return
    endif
    if &modified
        " echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])
        keepjumps exe '1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
            \ strftime('%Y-%m-%d %H:%M:%S+0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfun

function! NewTemplate()
    let l:wiki_directory = v:false
    for wiki in g:auto_template_list
        if expand('%:p:h') . '/' == expand(wiki.path)
            let l:wiki_directory = v:true
            break
        endif
    endfor
    if !l:wiki_directory
        return
    endif
    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'title      : "' . expand('%:t:r') . expand('"'))
    call add(l:template, 'date       : ' . strftime('%Y-%m-%d %H:%M:%S+0900'))
    call add(l:template, 'updated    : ' . strftime('%Y-%m-%d %H:%M:%S+0900'))
    call add(l:template, 'tags       : [""]')
    call add(l:template, 'categories : [""]')
    call add(l:template, 'draft      : true')
    call add(l:template, '---')
    call add(l:template, '')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

augroup vimwikiauto
    autocmd BufWritePre *wiki/*.md call LastModified()
    autocmd BufWritePre *post/*.md call LastModified()
    autocmd BufRead,BufNewFile *wiki/*.md call NewTemplate()
    autocmd BufRead,BufNewFile *post/*.md call NewTemplate()
augroup END

function! UpdateBookProgress()
  let l:save_cursor = getpos(".")
  let l:awk_command = "awk '{print int($4 * 100 / $6), \"\\% :\", $4, $5, $6 }'"
  %g,\v^\d+ \% : \d+ \/ \d+,exe "normal! V!" . l:awk_command . "\<CR>"
  call setpos('.', l:save_cursor)
endfunction

augroup todoauto
  autocmd BufWritePre *wiki/book.md call UpdateBookProgress()
augroup END

" set tab space 4 on vimwiki
autocmd FileType vimwiki setlocal shiftwidth=4 tabstop=4

" plugin name: rainbow-parentheses
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]

let g:rbpt_max = 14
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au VimEnter * RainbowParenthesesLoadRound
au VimEnter * RainbowParenthesesLoadSquare
au VimEnter * RainbowParenthesesLoadBraces
au VimEnter * RainbowParenthesesLoadChevrons

" plugin name: blamer
let g:blamer_enabled = 1
let g:blamer_delay = 0
let g:blamer_show_in_visual_modes = 0
let g:blamer_show_in_insert_modes = 0
let g:blamer_date_format = '%y/%m/%d %H:%M'
let g:blamer_prefix = ' > '

" plugin name: goyo
function! s:goyo_enter()
  imap <ESC> <ESC>zz
  IndentGuidesDisable
  RainbowParenthesesToggle
endfunction

function! s:goyo_leave()
  imap <ESC> <ESC>
  highlight ColorColumn cterm=NONE ctermbg=236
  highlight CursorLine cterm=NONE ctermbg=235
  highlight Normal     ctermbg=NONE guibg=NONE
  highlight Nontext    ctermbg=NONE guibg=NONE
  highlight Specialkey ctermbg=NONE guibg=NONE
  highlight LineNr     ctermbg=NONE guibg=NONE
  highlight SignColumn ctermbg=NONE guibg=NONE
  IndentGuidesEnable
  RainbowParenthesesToggle
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" plugin name: choosewin
let g:choosewin_overlay_enable = 1
let g:choosewin_label = 'asdfghjkl;'

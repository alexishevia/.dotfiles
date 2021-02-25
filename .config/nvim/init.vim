" Plugins ---------------------- {{{

call plug#begin('~/.config/nvim/plugged')

" color schemes
Plug 'rafi/awesome-vim-colorschemes'

" Intellisense engine for Vim8 & Neovim, full language server protocol support as VSCode
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" file explorer
Plug 'scrooloose/nerdtree'
Plug 'ivalkeen/nerdtree-execute'

" Adds a :Tabularize command to align items
Plug 'godlygeek/tabular'

" Adds a :GenerateMarkdownTOC command to generate a Markdown table of contents
Plug 'ajorgensen/vim-markdown-toc'

" Markdown syntax highlighting, matching rules and mappings
Plug 'plasticboy/vim-markdown'

" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" easy comment/uncomment
Plug 'tpope/vim-commentary'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " add Github support to vim-fugitive's :Gbrowse command
Plug 'tommcdo/vim-fubitive' " add Bitbucket support to vim-fugitive's :Gbrowse command

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" vim plugin to interact with tmux
Plug 'benmills/vimux'

" Run golang tests using vimux
Plug 'benmills/vimux-golang'

" Merge a tab's windows with the current tab
Plug 'vim-scripts/Tabmerge'

" pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" A very fast, multi-syntax context-sensitive color name highlighter
Plug 'ap/vim-css-color'

" allows you to visually select increasingly larger regions of text using the same key combination
Plug 'terryma/vim-expand-region'

" add terraform support
Plug 'hashivim/vim-terraform'

call plug#end()

" }}}

" Custom Mappings ---------------------- {{{

" change <Leader> key from \ to ,
let mapleader = ","

" remap backslash to clear highlight after a search
nnoremap \ :nohlsearch<CR>

" set <LocalLeader> key to -
let maplocalleader = "-"

" use jk as Escape
inoremap jk <esc>

" remap semicolon to colon
" in a US keyboard, this allows me to go into command line mode with a single key (just `;` instead of `Shift + ;`)
noremap ; :

" remap spacebar to "go to the next searched item" command
" By default, vim uses semicolon to go to the next searched item, but I remapped semicolon and lost this functionality.
" This remap lets me use spacebar to go to the next searched item.
noremap <space> ;

" use ? as "go to the previous searched item" command
" vim uses comma to go to the previous searched item, but I remapped comma and lost this functionality.
" This remap lets me use ? (In US keyboard you type `?` by doing `Shift + /`) to go to the previous searched item.
noremap ? ,

" remap U to real redo
nnoremap U :later<Enter>

" disable built-in mapping of Q to enter Ex mode
map Q <Nop>

" use ,t to create a new tab
nnoremap <leader>t :tabnew<Enter>

" use gr to go to previous tab
nnoremap gr :tabp<Enter>

" use F8 to move tab left
nnoremap <F8> :execute "tabmove" tabpagenr() - 2 <CR>

" use F9 to move tab right
nnoremap <F9> :execute "tabmove" tabpagenr() + 1 <CR>

" use ,- to split horizontally
nnoremap <leader>- :split<Enter>

" use ,| to split vertically
nnoremap <leader>\| :vsplit<Enter>

" resize split with ,HJKL
nnoremap <leader>J :res +5<Enter>
nnoremap <leader>K :res -5<Enter>
nnoremap <leader>L :vertical resize +5<Enter>
nnoremap <leader>H :vertical resize -5<Enter>

" use ,* to populate the quickfix window with all matches for the current word
" tip: use `]q` and `[q` to move between results, or :cw to open quickfix
" window
nnoremap <leader>* :Ggrep --untracked <cword><CR><CR>

" use ,ig to toggle cursorcolumn
nnoremap <Leader>ig :set cursorcolumn!<Enter>

" use , + direction to switch between splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" use ,cf to copy the full path to the current file
nnoremap <leader>cf :let @+=expand("%:p")<CR>

" use ,cr to copy the relative path to the current file
nnoremap <leader>cr :let @+=expand("%")<CR>

" use ,tf to test the function that is focused (under the cursor)
nnoremap <leader>tf :GoTestFunc<CR>

" use ,tp to run all tests for current package
nnoremap <leader>tp :GoTestPackage<CR>

" use ,ta to run all tests for current project
nnoremap <leader>ta :GoTest<CR>

" use ,vc to close the vimux runner window
nnoremap <leader>vc :VimuxCloseRunner<CR>

" run the align function after typing `|` from insert mode
" see: https://vimtricks.com/p/vertical-alignment/
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a

" }}}

" Abbreviations ---------------------- {{{

" replace 'ck' with a checkmark
iabbrev ck ✓

" replace '[bullet]' with an actual bullet
iabbrev [bullet] ∙
iabbrev [bullet1] •
iabbrev [bullet2] ◦

" }}}

" General Settings ---------------------- {{{

" use line numbers
set number

" display line numbers relative to the current curser position
set relativenumber

" ruler line
set colorcolumn=80

" highlight current line
set cursorline

" how many columns a tab counts for
set tabstop=2

" how many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=2

" amount of columns vim uses when you hit Tab in insert mode
set softtabstop=2

" convert tabs to spaces
set expandtab

" make search case-insensitive except when you include upper-case characters
set ignorecase
set smartcase

" enable 'concealing' by default
" see: https://alok.github.io/2018/04/26/using-vim-s-conceal-to-make-languages-more-tolerable/
set conceallevel=2

" enable mouse in terminal mode
set mouse=a

" don't create backup files
set nobackup
set nowritebackup
set noswapfile

" yank and paste with the system clipboard
    " linux
    set clipboard=unnamedplus
    " mac os
    if system("uname") == "Darwin\n"
      set clipboard=unnamed
    endif

" change color for tabs and trailing spaces
hi SpecialKey ctermfg=66 guifg=#649A9A

" by default, do not render hidden characters
" you can run `:set list!` to toggle between showing/hiding them
set listchars=tab:>-,space:·,trail:~
set nolist

" fold manually
" set foldmethod=manual

" when wrapping, don't split words
set linebreak

" add golint to runtime path
" use `:Lint` to run golint
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim

" load theme
colorscheme PaperColor

" }}}

" Custom Commands ---------------------- {{{

" :MDo runs the mdo command on the current file
command! MDo :call Preserve('%!mdo')

" :ReloadConfig reloads the init.vim file
command! ReloadConfig :source ~/.config/nvim/init.vim

" :GoTestFunc opens the vimux runner and runs the test that is under the cursor
command! GoTestFunc :call VimuxOpenRunner() | :call GolangTestFocused()

" :GoTestPackage opens the vimux runner and runs all tests for the current package
command! GoTestPackage :call VimuxOpenRunner() | :call GolangTestCurrentPackage()

" :GoTest opens the vimux runner and runs all tests for the current project
command! GoTest :call VimuxOpenRunner() | :call VimuxRunCommand("cd " . getcwd() . " && go test ./...")

" :GoImports will try to fix imports for the current file
command! GoImports :call Preserve('%!goimports')

" :DefRight will open the definition for the current variable in a right split
command! DefRight :call CocAction('jumpDefinition', 'tabe') | tabprevious | :call Tabmerge('right')

" TabmergeRight will move the tab on the right to a vertical split
command! TabmergeRight :call Tabmerge('right')

" }}}

" Custom Functions ---------------------- {{{

" TrimWhiteSpace removes trailing whitespace
function! <SID>TrimWhiteSpace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|mkd\|vmail'
    return
  endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" Preserve restores the cursor position, window position, and last search
" after running a command.
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

" automatically align tables (ie: markdown tables, cucumber tables, etc)
" see: https://vimtricks.com/p/vertical-alignment/
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" }}}

" Auto Commands ---------------------- {{{

augroup lex
  autocmd!

  " remove trailing whitespace on file save
  autocmd BufWritePre * :call <SID>TrimWhiteSpace()

  " check for external file changes
  autocmd CursorMoved * checktime
  autocmd CursorMovedI * checktime

  " set filetypes for common extensions
  autocmd BufNewFile,BufRead *.pp set filetype=ruby
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby
  autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby
  autocmd BufNewFile,BufRead *.tpl set syntax=make

  " on save, run MDo on any markdown file living inside a `todo/` folder
  autocmd BufWritePre *todo/*.md call Preserve('%!mdo')

  " set 'marker' foldmethod for vim files
  autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Plugin Settings: ctrlp ---------------------- {{{

" ctrlp - use ,p to do fuzzy filename search
let g:ctrlp_map = '<Leader>p'

" ctrlp - make ctrlp open files on new tab
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

" ctrlp - if silver surfer is available, use it for ctrlp
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" }}}

" Plugin Settings: nerdtree ---------------------- {{{

" nerdtree - show hidden files on NERDTree
let NERDTreeShowHidden=1

" nerdtree - use old folder markers (avoids issues with some terminals)
let g:NERDTreeDirArrows=0

" nerdtree - use ,r to open current file on NERDTree
nnoremap <leader>r :NERDTreeFind<cr>

" nerdtree - enable line numbers in NERDTree
let NERDTreeShowLineNumbers=1

" nerdtree - make sure relative line numbers are used in NERDTree
augroup relativenumber
  autocmd!
  autocmd FileType nerdtree setlocal relativenumber
augroup END

" }}}

" Plugin Settings: vim-markdown ---------------------- {{{

" vim-markdown - disable folding
let g:vim_markdown_folding_disabled = 1

" vim-markdown - close :Toc on <Enter>
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")

" }}}

" Plugin Settings: fugitive ---------------------- {{{

" fugitive - force diff to use vertical split
set diffopt=filler,vertical

" }}}

" Plugin Settings: vimux ---------------------- {{{

" vimux - percent of the screen the split pane Vimux will spawn should take up
let g:VimuxHeight = "40"

" }}}

" Plugin Settings: vim-expand-region ---------------------- {{{

" vim-expand-region - use v and ctrl v to expand/shrink selection
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" }}}

" Plugin Settings: vim-terraform ---------------------- {{{

" vim-terraform - align settings automatically with Tabularize.
let g:terraform_align=1

" vim-terraform - automatically format *.tf and *.tfvars files with terraform fmt.
" ie: run `:TerraformFmt` on save.
let g:terraform_fmt_on_save=1

" }}}

" Plugin Settings: coc.nvim ---------------------- {{{

" if hidden is not set, TextEdit might fail.
set hidden

" smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" use [d and ]d to navigate diagnostics
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" use gd to open definition in a new tab
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<cr>

" use gD to open definition in a right split
nmap <silent> gD :DefRight<cr>

" use ,f to format selected region
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" use Ctrl+Shift+P to show coc commands
nnoremap <silent> <C-S-P>  :<C-u>CocList commands<cr>

" }}}

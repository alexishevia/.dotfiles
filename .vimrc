" set 256 color terminal
set term=screen-256color

" load vim-plug
call plug#begin('~/.vim/plugged')

" fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" editorconfig.org support
Plug 'editorconfig/editorconfig-vim'

" auto-completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" easy comment/uncomment
Plug 'tpope/vim-commentary'

" file explorer
Plug 'scrooloose/nerdtree'
Plug 'ivalkeen/nerdtree-execute'

" syntax checking
" Plug 'w0rp/ale'
Plug 'scrooloose/syntastic'
Plug 'mtscout6/syntastic-local-eslint.vim'

" lean & mean status/tabline
Plug 'bling/vim-airline'

" easily align text
Plug 'junegunn/vim-easy-align'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'

" visually display indent levels in code
Plug 'nathanaelkane/vim-indent-guides'

" language pack
Plug 'sheerun/vim-polyglot'

" automatically detect indent settings
Plug 'tpope/vim-sleuth'

" extended % matching for HTML, LaTeX, and many other languages
Plug 'tmhedberg/matchit'

" handle unicode and digraphs characters
Plug 'chrisbra/unicode.vim'

" quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" markdown utilities
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'ajorgensen/vim-markdown-toc'
Plug 'xolox/vim-misc'

" Go development plugin for Vim
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

" color schemes
Plug 'rafi/awesome-vim-colorschemes'
" Plug 'xolox/vim-colorscheme-switcher'

" utility functions
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'

" Add plugins to &runtimepath
call plug#end()

" use line numbers
set number

" display line numbers relative to the current curser position
set relativenumber

" change <Leader> key from \ to ,
let mapleader = ","

" set <LocalLeader> key to -
let maplocalleader = "-"

" use jk instead of Escape
inoremap jk <esc>

" make j & k move up/down a single row in the screen (not on a linewise basis)
nnoremap j gj
nnoremap k gk

" load theme
colorscheme PaperColor

" specify dark background (for plugins that don't read it properly from theme)
set background=dark

" set font
set guifont=Monaco:h12

" enable statusline
set laststatus=2

" make search case-insensitive except when you include upper-case characters
set ignorecase
set smartcase

" highlight search as you type
set incsearch

" highlight all matches when doing search (not just the next one)
set hlsearch

" use \ to clear highlight after a search
nnoremap \ :nohlsearch<CR>

" define a 'remove trailing whitespace' function:
fun! <SID>TrimWhiteSpace()
  " Don't strip on these filetypes
  if &ft =~ 'markdown\|mkd\|vmail'
    return
  endif
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" remove trailing whitespace on file save:
augroup trimWhitespace
  autocmd!
  autocmd BufWritePre * :call <SID>TrimWhiteSpace()
augroup END

" enable mouse in terminal mode
set mouse=a
set ttym=xterm2

" check for external file changes
au CursorMoved * checktime
au CursorMovedI * checktime

" enable auto-complete on startup
let g:deoplete#enable_at_startup = 1

" auto-complete use smartcase
let g:deoplete#enable_smart_case = 1

" auto-complete <CR> completion.
inoremap <expr><CR> pumvisible() ? "\<C-n>" : "\<CR>"

" use ,p to do fuzzy filename search
nnoremap <Leader>p :CtrlP<Enter>

" make ctrlP open files on new tab
let g:ctrlp_prompt_mappings = {
      \ 'AcceptSelection("e")': ['<c-t>'],
      \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
      \ }

" make ctrlP ignore files specified on .gitignore
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others'],
    \ 2: ['.hg', 'hg --cwd %s locate -I .'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }

" if silver surfer is available, use it for ctrlp
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
endif

" show hidden files on NERDTree
let NERDTreeShowHidden=1

" fold manually
set foldmethod=manual

" use old folder markers (avoids issues with some terminals)
let g:NERDTreeDirArrows=0

" use ,n to toggle nerdtreetabs
nnoremap <Leader>n :NERDTreeToggle<Enter>

" use ,r to open current file on NERDTree
nnoremap <leader>r :NERDTreeFind<cr>

" enable line numbers in NERDTree
let NERDTreeShowLineNumbers=1

" make sure relative line numbers are used in NERDTree
augroup relativenumber
  autocmd!
  autocmd FileType nerdtree setlocal relativenumber
augroup END

" use ,t to create a new tab
nnoremap <leader>t :tabnew<Enter>

" use gr to go to previous tab
nnoremap gr :tabp<Enter>

" yank and paste with the system clipboard

    " linux
    set clipboard=unnamedplus

    " mac os
    if system("uname") == "Darwin\n"
      set clipboard=unnamed
    endif

" use ENTER to add new lines without going into insert mode
" I had to disable this in order to get :Toc working correctly.
" see: https://github.com/plasticboy/vim-markdown/issues/359
" nnoremap <CR> o<Esc>k

" disable vim-markdown folding
let g:vim_markdown_folding_disabled = 1

" close :Toc on <Enter>
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")

" Start recording keystrokes by typing qq.
" End recording with q (first press Escape if you are in insert mode).
" Play the recorded keystrokes by hitting space.
nnoremap <Space> @q

" detect utf-8
if has("multi_byte")
  set encoding=utf-8                     " better default than latin1
  setglobal fileencoding=utf-8           " change default file encoding when writing new files
  set termencoding=utf-8
endif

" use F8 to move tab left
noremap <F8> :execute "tabmove" tabpagenr() - 2 <CR>

" use F9 to move tab right
noremap <F9> :execute "tabmove" tabpagenr() + 1 <CR>

" make sure wrap is not turned off by vimdiff
au VimEnter * if &diff | execute 'windo set wrap' | endif

" force fugitive diff to use vertical split
set diffopt=filler,vertical

" set filetypes for common extensions
au BufNewFile,BufRead *.pp set filetype=ruby
au BufNewFile,BufRead Vagrantfile set filetype=ruby
au BufNewFile,BufRead *.jbuilder set filetype=ruby

" remap U to real undo
nnoremap U :later<Enter>

" use , + direction to switch between splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" enable Matchit macro
runtime macros/matchit.vim

" allow matchit to navigate quickly to ending tag in xml/html files
augroup matchit
  autocmd!
  autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType xhtml let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType xml let b:match_words = '<\(\w\w*\):</\1,{:}'
  autocmd FileType eco let b:match_words = '<\(\w\w*\):</\1,{:}'
augroup END

" remap semicolon to colon (no need to use Shift + ;)
nnoremap ; :

" set secure mode for reading .vimrc
set secure

" read .vimrc or .exrc on the current directory
set exrc

" ruler line
set colorcolumn=80

" display tabs and trailing spaces
set listchars=tab:>-,trail:~
set list

" change color for tabs and trailing spaces
hi SpecialKey ctermfg=66 guifg=#649A9A

" highlight current line
set cursorline

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vnoremap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nnoremap ga <Plug>(EasyAlign)

" by default, don't highlight anything
match none

" define a 'highlight leading tabs' function:
function! HighlightTabs()
  highlight UnwantedChars ctermbg=darkgreen guibg=darkgreen
  match UnwantedChars /^\t\+/ " leading tabs are unwanted
endfunction

" define a 'highlight leading and trailing whitespace' function:
function! HighlightSpaces()
  highlight UnwantedChars ctermbg=darkgreen guibg=darkgreen
  match UnwantedChars /^\s* \s*\|\s\+$/ " leading and trailing whitespace is unwanted
endfunction

" use ,ht to highlight leading tabs
nnoremap <Leader>ht :call HighlightTabs()<CR>

" use ,hs to highlight leading spaces
nnoremap <Leader>hs :call HighlightSpaces()<CR>

" define a function to easily change indent size
function! IndentSize(len)
  execute "set tabstop =".a:len
  execute "set shiftwidth =".a:len
  execute "set softtabstop =".a:len
endfunction

" how many columns a tab counts for
set tabstop=2

" how many columns text is indented with the reindent operations (<< and >>)
set shiftwidth=2

" amount of columns vim uses when you hit Tab in insert mode
set softtabstop=2

" convert tabs to spaces
set expandtab

" replace 'ck' with a checkmark
iabbrev ck 🗸

" replace '[bullet]' with an actual bullet
iabbrev [bullet] ∙
iabbrev [bullet1] •
iabbrev [bullet2] ◦

" don't create backup files
set nobackup
set nowritebackup
set noswapfile

" save backup files to a custom directory
" set backupdir=~/.vim/backup

" use ,cf to copy the full path to the current file
nnoremap <leader>cf :let @+=expand("%:p")<CR>

" syntastic settings
let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers=['pylama']
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_coffee_checkers=['coffeelint']

" run mdo on todo.md files
augroup mdo
  autocmd!

  autocmd BufWritePost todo.md !mdo %
augroup END

" --- javascript --- "

augroup javascript
  autocmd!

  " use -f to follow ctags definition
  autocmd FileType javascript,javascript.jsx nnoremap <buffer> <localleader>f <C-]>

  " use -F to pop out from ctags definition
  autocmd FileType javascript,javascript.jsx nnoremap <buffer> <localleader>F <C-T>

  " use -p to open CtrlP in tag mode
  autocmd FileType javascript,javascript.jsx nnoremap <buffer> <localleader>p :CtrlPTag<cr>
augroup END

nnoremap <buffer> <localleader>d <Ctrl>]

" --- golang --- "

" auto :GoMetaLinter on save
let g:go_metalinter_autosave = 1

augroup golang
  autocmd!

  " do not display tabs and trailing spaces for go files
  autocmd FileType go setlocal nolist

  " use -f for :GoDef
  autocmd FileType go nnoremap <buffer> <localleader>f :GoDef<CR>

  " use -F for :GoDefPop
  autocmd FileType go nnoremap <buffer> <localleader>F :GoDefPop<CR>

  "use -p to open CtrlP in tag mode
  autocmd FileType go nnoremap <buffer> <localleader>p :GoDeclsDir<CR>

  " use -b for :GoBuild
  autocmd FileType go nnoremap <buffer> <localleader>b :GoBuild<CR>

  " use -r for :GoRun
  autocmd FileType go nnoremap <buffer> <localleader>r :GoRun<CR>

  " use -t for :GoTest
  autocmd FileType go nnoremap <buffer> <localleader>t :GoTest<CR>

  " use -c for :GoCoverageToggle
  autocmd FileType go nnoremap <buffer> <localleader>c :GoCoverageToggle<CR>

  " use -l for :GoMetaLinter
  autocmd FileType go nnoremap <buffer> <localleader>l :GoMetaLinter<CR>

  " use -dS for :GoDebugStart
  autocmd FileType go nnoremap <buffer> <localleader>dS :GoDebugStart<CR>

  " use -db for :GoDebugBreakpoint
  autocmd FileType go nnoremap <buffer> <localleader>db :GoDebugBreakpoint<CR>

  " use -dc for :GoDebugContinue
  autocmd FileType go nnoremap <buffer> <localleader>dc :GoDebugContinue<CR>

  " use -dn for :GoDebugNext
  autocmd FileType go nnoremap <buffer> <localleader>dn :GoDebugNext<CR>

  " use -ds for :GoDebugStep
  autocmd FileType go nnoremap <buffer> <localleader>ds :GoDebugStep<CR>

  " use -do for :GoDebugStepOut
  autocmd FileType go nnoremap <buffer> <localleader>do :GoDebugStepOut<CR>

  " use -dp for :GoDebugPrint
  autocmd FileType go nnoremap <buffer> <localleader>dp :GoDebugPrint

  " use -dX for :GoDebugStop
  autocmd FileType go nnoremap <buffer> <localleader>dX :GoDebugStop<CR>
augroup END

" -----------------------------------------------------------------------------
" Plugins
" -----------------------------------------------------------------------------

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

" easy comment/uncomment
Plug 'tpope/vim-commentary'

" a Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " add Github support to vim-fugitive's :Gbrowse command
Plug 'tommcdo/vim-fubitive' " add Bitbucket support to vim-fugitive's :Gbrowse command

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" -----------------------------------------------------------------------------
" Custom Mappings
" -----------------------------------------------------------------------------

" change <Leader> key from \ to ,
let mapleader = ","

" set <LocalLeader> key to -
let maplocalleader = "-"

" use jk instead of Escape
inoremap jk <esc>

" remap semicolon to colon (no need to use Shift + ;)
noremap ; :

" remap U to real undo
nnoremap U :later<Enter>

" disable built-in mapping of Q to enter Ex mode
map Q <Nop>

" use \ to clear highlight after a search
nnoremap \ :nohlsearch<CR>

" use ,t to create a new tab
nnoremap <leader>t :tabnew<Enter>

" use gr to go to previous tab
nnoremap gr :tabp<Enter>

" use F8 to move tab left
noremap <F8> :execute "tabmove" tabpagenr() - 2 <CR>

" use F9 to move tab right
noremap <F9> :execute "tabmove" tabpagenr() + 1 <CR>

" use ,- to split horizontally
nnoremap <leader>- :split<Enter>

" use ,| to split vertically
nnoremap <leader>\| :vsplit<Enter>

" resize split with ,HJKL
nnoremap <leader>J :res +5<Enter>
nnoremap <leader>K :res -5<Enter>
nnoremap <leader>L :vertical resize +5<Enter>
nnoremap <leader>H :vertical resize -5<Enter>

" use ,ig to toggle cursorcolumn
nnoremap <Leader>ig :set cursorcolumn!<Enter>

" mappings to align text
" see: http://vimcasts.org/episodes/aligning-text-with-tabular-vim/
if exists(":Tabularize")
  " use ,a= to align by equal sign (=)
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>

  " use ,a| to align by pipe (|)
  nmap <Leader>a\| :Tabularize /\|<CR>
  vmap <Leader>a\| :Tabularize /\|<CR>

  " use ,a: to align by colon (:)
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

" use , + direction to switch between splits
nnoremap <leader>j <C-W><C-J>
nnoremap <leader>k <C-W><C-K>
nnoremap <leader>l <C-W><C-L>
nnoremap <leader>h <C-W><C-H>

" use ,cf to copy the full path to the current file
nnoremap <leader>cf :let @+=expand("%:p")<CR>

" use ,cr to copy the relative path to the current file
nnoremap <leader>cr :let @+=expand("%")<CR>

" -----------------------------------------------------------------------------
" Abbreviations
" -----------------------------------------------------------------------------

" replace 'ck' with a checkmark
iabbrev ck 🗸

" replace '[bullet]' with an actual bullet
iabbrev [bullet] ∙
iabbrev [bullet1] •
iabbrev [bullet2] ◦

" -----------------------------------------------------------------------------
" General Settings
" -----------------------------------------------------------------------------

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
set foldmethod=manual

" -----------------------------------------------------------------------------
" Plugin specific settings
" -----------------------------------------------------------------------------

" colorschemes - load theme
colorscheme PaperColor

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

" vim-markdown - disable folding
let g:vim_markdown_folding_disabled = 1

" vim-markdown - close :Toc on <Enter>
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")

" fugitive - force diff to use vertical split
set diffopt=filler,vertical

" -----------------------------------------------------------------------------
" coc.nvim default settings
" -----------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" better display for messages
set cmdheight=2

" smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

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

" use ,f to format selected region
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

" use Ctrl+Shift+P to show coc commands
nnoremap <silent> <C-S-P>  :<C-u>CocList commands<cr>

" -----------------------------------------------------------------------------
" Custom Commands
" -----------------------------------------------------------------------------

" :ReloadConfig reloads the init.vim file
command! ReloadConfig :source ~/.config/nvim/init.vim

" -----------------------------------------------------------------------------
" Custom Functions
" -----------------------------------------------------------------------------

" TrimWhiteSpace removes trailing whitespace
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

" -----------------------------------------------------------------------------
" Auto Commands
" -----------------------------------------------------------------------------

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

  " on save, run goimports on any go file
  autocmd BufWritePre *.go call Preserve('%!goimports')

augroup END

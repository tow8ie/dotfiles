set nocompatible

" ----------- "
" Vim Plugins "
" ----------- "

filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tpope/vim-rails'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'vim-scripts/AutoClose'
Bundle 'tpope/vim-endwise'
Bundle 'tow8ie/vim-colors'
Bundle 'tpope/vim-surround'
Bundle 'kana/vim-textobj-user'
Bundle 'vim-scripts/Markdown'
Bundle 'vim-scripts/github-theme'
Bundle 'sjl/gundo.vim'
Bundle 'vim-scripts/YankRing.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'mileszs/ack.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'tpope/vim-fugitive'
Bundle 'tow8ie/syntastic'
Bundle 'kchmck/vim-coffee-script'
Bundle 'sjl/threesome.vim'
Bundle 'int3/vim-extradite'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-commentary'
Bundle 'kien/ctrlp.vim'
Bundle 'vim-scripts/Lucius'
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/VimClojure'

filetype plugin indent on

" --------- "
" Functions "
" --------- "

" A function that runs a command and preserves search history and cursor position
" Seen at http://vimcasts.org/episodes/tidying-whitespace
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

" -------- "
" Encoding "
" -------- "

set encoding=utf-8

" ------------------- "
" Syntax highlighting "
" ------------------- "

syntax enable

set list
set listchars=tab:▸\ ,eol:¬

" ----------- "
" Colorscheme "
" ----------- "

let g:lucius_style = "light"
let g:solarized_termcolors=256
let g:solarized_visibility = "low"

colorscheme lucius

" --------------------- "
" Map leader definition "
" --------------------- "

" A more german keyboard friendly mapleader
let mapleader = ","
let maplocalleader = "ä"

" ---------- "
" Appearance "
" ---------- "

set number " Show line numbers.
set ruler " Show cursor position.

" Highlight current line/cursor line in current window
set cursorline
autocmd WinLeave * set nocursorline
autocmd WinEnter * set cursorline

set wrap " Turn on line wrapping.
set scrolloff=3 " Show 3 lines of context around the cursor.

set title " Set the terminal's title

" Show the status line all the time
set laststatus=2

" ------- "
" Windows "
" ------- "

set splitright

" -------------- "
" netrw Settings "
" -------------- "

let g:netrw_liststyle=3 " Use tree-mode as default view

" ------- "
" Editing "
" ------- "

" Load the matchit plugin.
runtime macros/matchit.vim

set cpoptions+=$

set tabstop=2 " Global tab width.
set shiftwidth=2 " And again, related.
set expandtab " Use spaces instead of tabs

" --------- "
" Clipboard "
" --------- "

" Uses the system clipboard as the default register
set clipboard=unnamed

" --------- "
" Behaviour "
" --------- "

set showcmd " Display incomplete commands.
set showmode " Display the mode you're in.
set backspace=indent,eol,start " Intuitive backspacing.

set wildmenu " Enhanced command line completion.
set wildmode=list:longest " Complete files like a shell.
set wildignore+=tmp/**,*.scssc,*.sassc,*/vendor/bundle/**,server/**
" CtrlP needs these dirs to be excluded
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

set visualbell " No beeping.

set nobackup " Don't make a backup before overwriting a file.
set nowritebackup " And again.
" set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
set noswapfile " Don’t create a swapfile
set autoread " Autoupdate files changed by other processes without a warning

set hidden " Handle multiple buffers better.

" ------ "
" Search "
" ------ "

set ignorecase " Case-insensitive searching.
set smartcase " But case-sensitive if expression contains a capital letter.
set incsearch " Highlight matches as you type.
set hlsearch " Highlight matches.

" Forward and backward search for selected text
" @see http://vim.wikia.com/wiki/Search_for_visually_selected_text

vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>

" --------- "
" Syntastic "
" --------- "

let g:syntastic_enable_signs=1

" --------- "
" Command-T "
" --------- "

let g:CommandTMaxHeight=10
let g:CommandTMatchWindowReverse=1

" ---------- "
" EasyMotion "
" ---------- "

let g:EasyMotion_leader_key = 'ö'

" ------- "
" Nailgun "
" ------- "

let vimclojure#WantNailgun = 1
let vimclojure#NailgunClient = "/usr/local/bin/ng"
let vimclojure#SplitPos = "right"

" ----- "
" Rspec "
" ----- "

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !echo;echo;echo;echo;echo
  exec ":!bundle exec rspec " . a:filename
endfunction

function! SetTestFile()
  " Set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " Run the tests for the previously-marked file.
  let in_spec_file = match(expand("%"), '_spec.rb$') != -1
  if in_spec_file
    call SetTestFile()
  elseif !exists("t:grb_test_file")
    return
  end
  call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
  let spec_line_number = line('.')
  call RunTestFile(":" . spec_line_number)
endfunction

" Run this file
map <leader><leader>t :call RunTestFile()<cr>
" Run only the example under the cursor
map <leader><leader>T :call RunNearestTest()<cr>
" Run all test files
map <leader><leader>a :call RunTests('spec')<cr>

" Fold all example groups in the entire file except the full hierarchy to your spec that your cursor is inside.
" The current example is automatically centered on your screen, when possible.
" Taken from https://gist.github.com/1390108
nmap <silent> <Leader>rf mr:set foldmethod=syntax<CR>zMzv?\v^\s*(it\|example)<CR>zz:noh<CR>`r:delmarks r<CR>

" --------------- "
" Custom Mappings "
" --------------- "

" Quickly exit out of insert mode
inoremap kj <Esc>l

" Expand %% to current file’s directory in command mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Expand %_ to current file in command mode
cnoremap %_ <C-R>=expand('%')<cr>

" Mappings for moving text
" Found here: http://vim.wikia.com/wiki/Moving_lines_up_or_down
" The D mapping means the Command key on a Mac

nnoremap <D-j> :m+<CR>==
nnoremap <D-k> :m-2<CR>==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=gv
vnoremap <D-k> :m-2<CR>gv=gv

" Changing window focus
noremap <C-H> <C-w>h
noremap <C-J> <C-w>j
noremap <C-K> <C-w>k
noremap <C-L> <C-w>l

" Create new line under current one in insert mode with Ctrl-Return
inoremap <c-cr> <esc>A<cr>

" Funky complicated macro that creates a box comment
" But just for single char single line comments…
map <leader>cb yyP^wv$r-jyyp^wv$r-kk^vyA <esc>pjA <esc>pjA <esc>p<cr>

" Remove trailing whitespace
nmap <Leader><space> :call Preserve("%s/\\s\\+$//e")<CR>

" Echoes the syntax rules matching whatever is under the cursor,
" so you know what to change in your colorscheme.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc
nnoremap <leader>s :call SynStack()<CR>

" Make help open in a nice, big vertical split.
au BufWinEnter *.txt if &ft  == 'help' | wincmd L | endif

" Show a preview of CoffeeScript Compilation
nnoremap <leader>cc :CoffeeCompile<cr>


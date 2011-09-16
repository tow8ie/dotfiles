set nocompatible " Must come first because it changes other options.

" -------- "
" Pathogen "
" -------- "

silent! call pathogen#runtime_append_all_bundles()
" I think this automatically create helptags for all pathogen installed bundles
call pathogen#helptags()

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

" ------------------- "
" Syntax highlighting "
" ------------------- "

syntax enable

set list
set listchars=tab:▸\ ,eol:¬

" Turn on file type detection.
filetype plugin indent on

" ----------- "
" Colorscheme "
" ----------- "

set background=dark
let g:solarized_termcolors=256
let g:solarized_visibility = "low"
colorscheme solarized

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
set cursorline " Highlight current line/cursor line

set wrap " Turn on line wrapping.
set scrolloff=3 " Show 3 lines of context around the cursor.

set title " Set the terminal's title

" Show the status line all the time
set laststatus=2
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set statusline+=%#warningmsg#
set statusline+=%{exists('*SyntasticStatuslineFlag')?SyntasticStatuslineFlag():''}
set statusline+=%*

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
set wildignore+=tmp/**,*.scssc,*.sassc

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

nmap <silent> <Leader><C-f> :CommandT<CR>
let g:CommandTMaxHeight=10
let g:CommandTMatchWindowReverse=1

" ---------- "
" EasyMotion "
" ---------- "

let g:EasyMotion_leader_key = 'ö'

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

" --------------- "
" Custom Mappings "
" --------------- "

" Quickly exit out of insert mode
inoremap kj <Esc>

" Expand %% to current file’s directory in command mode
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Mappings for moving text
" Found here: http://vim.wikia.com/wiki/Moving_lines_up_or_down
" The D mapping means the Command key on a Mac

nnoremap <D-j> :m+<CR>==
nnoremap <D-k> :m-2<CR>==
inoremap <D-j> <Esc>:m+<CR>==gi
inoremap <D-k> <Esc>:m-2<CR>==gi
vnoremap <D-j> :m'>+<CR>gv=gv
vnoremap <D-k> :m-2<CR>gv=gv

" Create new line under current one in insert mode with Ctrl-Return
inoremap <c-cr> <esc>A<cr>

" Funky complicated macro that creates a box comment
" But just for single char single line comments…
map <leader>bc yyP^wv$r-jyyp^wv$r-kk^vyA <esc>pjA <esc>pjA <esc>p<cr>

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


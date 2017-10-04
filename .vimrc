
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2015 Mar 24
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  " filetype plugin indent on
  
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Tab settings
set tabstop=4
set shiftwidth=4
set expandtab

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif

" Switch off automatic backup file
set nobackup
set noundofile

" Pathogen - Runtime Path Manipulation
execute pathogen#infect()

" Colors
set number

if &term == "xterm-256color"
  colorscheme hybrid_material
  hi LineNr ctermfg=237 ctermbg=234
  hi NonText ctermfg=234 ctermbg=234
  hi CursorLineNr ctermfg=237 ctermbg=234
  hi Comment ctermfg=238
  hi Normal ctermbg=None
else
  set t_Co=256
  colorscheme hybrid_material
  hi LineNr ctermfg=DarkGrey
  hi NonText ctermfg=DarkGrey
  hi CursorLineNr ctermfg=DarkGrey
  hi Normal ctermbg=234
  hi Comment ctermfg=DarkGrey
endif

set cursorline
hi CursorLine cterm=None ctermbg=None
hi CursorLineNr cterm=None ctermbg=16
hi Search ctermfg=255 ctermbg=25
hi VertSplit ctermfg=234 ctermbg=234

" Start NerdTree on launch
"autocmd vimenter * NERDTree

" Syntastic Options
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" let g:syntastic_javascript_checkers = ["eslint"]
" let g:syntastic_go_checkers = ["go", "errcheck", "go"]

" let g:syntastic_quiet_messages = {"type": "style"}

" let g:syntastic_cpp_compiler_options = " -std=c++11"

" Better window management
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" General defaults
set scrolloff=5
set autoread
set ignorecase

" Code Folding
set foldmethod=indent
set foldlevel=99

nnoremap <space> za

" BreakLine: Return TRUE if in the middle of {} or () in INSERT mode
fun BreakLine()
  if (mode() == 'i')
    return ((getline(".")[col(".")-2] == '{' && getline(".")[col(".")-1] == '}') ||
          \(getline(".")[col(".")-2] == '(' && getline(".")[col(".")-1] == ')'))
  else
    return 0
  endif
endfun

" Remap <Enter> to split the line and insert a new line in between if
" BreakLine return True
inoremap <expr> <CR> BreakLine() ? "<CR><ESC>O" : "<CR>"

" vim-airline
set laststatus=2
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#syntastic#enabled = 1
let g:airline_powerline_fonts = 1 " Make sure terminal uses appropriate font
let g:airline_theme = "jellybeans"

" Syntax settings
let g:polyglot_disabled = ['python']
let g:jsx_ext_required = 0

" NERDTree settings
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup = 1

" gitgutter settings
set updatetime=250
if exists('&signcolumn')  " Vim 7.4.2201
  set signcolumn=yes
else
  let g:gitgutter_sign_column_always = 1
endif

" vim-go settings
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck', 'deadcode']
let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck', 'deadcode']
let g:go_metalinter_autosave = 1

" Completor settings
let g:completor_blacklist = ['tagbar', 'qf', 'netrw', 'unite', 'vimwiki', 'go']
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" YouCompleteMe settings
" let g:ycm_filetype_whitelist = { 'go': 1 }

" vim-esearch
let g:esearch#out#win#open = 'enew'

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Startup commands
" autocmd VimEnter * NERDTree
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType scss setlocal shiftwidth=2 tabstop=2
autocmd FileType css setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead .babelrc set syntax=json
autocmd BufNewFile,BufRead .eslintrc set syntax=json
autocmd BufNewFile,BufRead .stylelintrc set syntax=json

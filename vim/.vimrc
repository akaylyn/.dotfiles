set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'mileszs/ack.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/syntastic'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'flazz/vim-colorschemes'
"Bundle 'nvie/vim-flake8'
Bundle 'bling/vim-airline'
Bundle 'guns/xterm-color-table.vim'
"Bundle 'leafgarland/typescript-vim'
Bundle 'jason0x43/vim-js-indent'
Bundle 'groenewege/vim-less'

" vim-scripts repos
"Bundle 'L9'
"Bundle 'FuzzyFinder'
" non github repos
"Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

set undodir=~/.cache/vim
set t_Co=256
set background=dark
colorscheme molokai
syntax on
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,Bufread *.ino set filetype=c

" auto remove trailling whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

" auto eol at end

let mapleader=" "
set expandtab
set softtabstop=4
set shiftwidth=4
set nospell
set tabstop=4
set wrap                      " Wrap long lines
set autoindent                  " Indent at the same level of the previous line
"set list listchars=tab:>·,trail:·
set history=1000
set number
set relativenumber
set showmode                    " Display the current mode
set cursorline                  " Highlight current line
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too


highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter

set tags=./tags;/

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " A ruler on steroids
    set showcmd                 " Show partial commands in status line and
                                " Selected characters/lines in visual mode
endif
set laststatus=2

"if has('statusline')
"    set laststatus=2
"
"    " Broken down into easily includeable segments
"    set statusline=%<%f\                     " Filename
"    set statusline+=%w%h%m%r                 " Options
"    set statusline+=%{fugitive#statusline()} " Git Hotness
"    set statusline+=\ [%{&ff}/%Y]            " Filetype
"    set statusline+=\ [%{getcwd()}]          " Current dir
"    set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
"endif
"
set pastetoggle=<F2>
" ctrlp {
	let g:ctrlp_working_path_mode = 'ra'
	nnoremap <silent> <D-t> :CtrlP<CR>
	nnoremap <silent> <D-r> :CtrlPMRU<CR>
    set wildignore+=*.so,*.swp,*/tests/coverage/*
	let g:ctrlp_custom_ignore = {
		\ 'dir':  '\.git$\|\.hg$\|\.svn$\|\v[\/]\.(tests/coverage/)$',
		\ 'file': '\.exe$\|\.so$\|\.dll$'
    \ }

	let g:ctrlp_user_command = {
		\ 'types': {
			\ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
			\ 2: ['.hg', 'hg --cwd %s locate -I .'],
		\ },
		\ 'fallback': 'find %s -type f'
	\ }
"}

let python_highlight_builtins = 1

" golang {
	" apply gofmt to the current file silently

" }


" ctags {

    let g:ctags_statusline=1
        " enable display of function names in the status line

    " Other configuration variables you may want to change are:

    " g:ctags_args
        " Additional arguments to the ctags program.

    let g:ctags_title = 1
        " Set to 1 if you want the function name also displayed in the title bar.
        " This is the default, but if g:ctags_statusline is set to 1, this must also be
        " set to one to show the function name in the title bar. Otherwise, the
        " function name appears only in the status line.

    let generate_tags = 1
        " Set to 1 if you want the script to be started automatically for the supported
        " file types (actually file extensions). Otherwise the script must be started
        " manually with the CTAGS command.

    let g:ctags_regenerate = 1
        " Set to 0 if you don't want the tags database rebuilt each time
        " the buffer is written.
" }

" indent guides {
	let g:indent_guides_enable_on_vim_startup = 1
	let g:indent_guides_auto_colors = 0
	let g:indent_guides_color_change_percent = 45
	let g:indent_guides_guide_size = 1
	let g:indent_guides_start_level = 1
	autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=purple	ctermbg=233
	autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=yellow	ctermbg=234
" }

" pwerline fonts for vim-airline {
	let g:airline_powerline_fonts = 1
	let g:airline_theme = 'molokai'
" }

" Window management! {
	" Window management hotkeys
	function! WinMove(key)
	let t:curwin = winnr()
	execute "wincmd ".a:key

	if (t:curwin == winnr()) " Couldn't move, create a window
	if (match(a:key,'[jk]')) " Create vertical split
	wincmd v
	else " Create horizontal split
	wincmd s
	endif

	" Move to the newly created window
	exec "wincmd ".a:key
	endif
	endfunction

	" Window navigate/create
	noremap <leader>h :call WinMove('h')<cr>
	noremap <leader>k :call WinMove('k')<cr>
	noremap <leader>l :call WinMove('l')<cr>
	noremap <leader>j :call WinMove('j')<cr>

	" Window moving
	noremap <leader>H :wincmd H<cr>
	noremap <leader>K :wincmd K<cr>
	noremap <leader>L :wincmd L<cr>
	noremap <leader>J :wincmd J<cr>

	" Window resizing
	nnoremap <left>  :3wincmd <<cr>
	nnoremap <right> :3wincmd ><cr>
	nnoremap <up>    :3wincmd +<cr>
	nnoremap <down>  :3wincmd -<cr>

	" Close/rotate
	noremap <leader>wc :wincmd q<cr>
	noremap <leader>wr <C-W>r
" }

" vim-js-indent {
" }

" Syntastic {

   let g:syntastic_enable_highlighting = 1
   let g:syntastic_auto_jump = 2
   let g:syntastic_auto_loc_list = 1



" }


" this is supposed to auto reload .vimrc ?
autocmd BufWritePost .vimrc source %


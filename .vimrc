" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
"if filereadable("/etc/vim/gvimrc.local")
"  source /etc/vim/gvimrc.local
"endif

execute pathogen#infect()

"filetype plugin indent on
filetype plugin on

colorscheme inkpot

" airline
set laststatus=2
set encoding=utf-8
"let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

" vim-go
let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_def_mode = 'godef'
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1

let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#enable_at_startup = 1
" <TAB>: completion. NOTE: TAB completion conflicts with ultisnips so change
" to Enter
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><Enter>  pumvisible() ? "\<C-n>" : "\<Enter>"
" close preview window on completion
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt-=preview

" deoplete-go
g:deoplete#sources#go#source_importer = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set colorcolumn=80
set nocompatible
set number
set tabstop=8
set shiftwidth=8
set autoindent " always set autoindenting on
set copyindent " copy the previous indentation on autoindenting
set shiftround " use multiple of shiftwidth when indenting with '<' and '>'
"set guioptions-=m
if has('gui_running')
	set guioptions-=T
	set guioptions-=r
	set guioptions-=L
endif
set guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
"set guifont=Fixedsys\ Excelsior\ 3.01\ 12
set ffs=unix,dos
set cursorline

" render tabs and trailing spaces
nmap <leader>l :set list!<CR>
set list
set listchars=tab:\|\ ",extends:\>,nbsp:. "trail:-,

" invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

" no swp and ~ files
set noswapfile
set nobackup

set ignorecase " ignore case when searching
set smartcase " ignore case if search pattern is all lowercase, case-sensitive otherwise
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch " highlight search terms

autocmd VimEnter * NERDTree
" to move the cursor to the main window at start instead of in NERDTree one
autocmd VimEnter * wincmd p

" automatically add closing }
inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
" automatically add closing )
inoremap (      ()<Left>
inoremap (<CR>  (<CR>)<Esc>O
inoremap ((     (
inoremap ()     ()
" automatically add closing ]
inoremap [      []<Left>
inoremap [<CR>  [<CR>]<Esc>O
inoremap [[     [
inoremap []     []
" automatically add closing "
inoremap "      ""<Left>
inoremap "<CR>  "<CR>"<Esc>O
inoremap ""     "
inoremap ""     ""
" automatically add closing '
"inoremap '      ''<Left>
"inoremap '<CR>  '<CR>'<Esc>O
"inoremap ''     '
"inoremap '' ''

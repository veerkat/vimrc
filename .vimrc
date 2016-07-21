syntax enable
syntax on
set number
set cursorline
set t_Co=256


if has('gui_running')
	"let g:winManagerWindowLayout='FileExplorer|TagList'
	
	"set background=dark
	"colorscheme solarized
	colorscheme molokai
	set guifont=Inconsolata\ for\ Powerline:h16
else
	colorscheme Tomorrow-Night-Eighties
endif

"Add 80 column line
let &colorcolumn="81,".join(range(120,999),",")
"end

filetype plugin indent on
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype erlang setlocal ts=4 sts=4 sw=4 expandtab

"Configure Vundle

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/syntastic'
Plugin 'jimenezrick/vimerl'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'airblade/vim-gitgutter'
Plugin 'nvie/vim-flake8'
"Plugin 'davidhalter/jedi-vim'
Plugin 'hynek/vim-python-pep8-indent'
" Track the engine.
Plugin 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

Plugin 'itchyny/calendar.vim'
Plugin 'mhinz/vim-startify'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-fugitive'
Plugin 'gregsexton/gitv'
Plugin 'sjl/gundo.vim'
Plugin 'kien/ctrlp.vim'
"Plugin 'flazz/vim-colorschemes'
"Plugin 'zenorocha/dracula-theme'

Plugin 'winmanager'
Plugin 'a.vim'
Plugin 'bufexplorer.zip'
Plugin 'taglist.vim'
Plugin 'grep.vim'
Plugin 'flazz/vim-colorschemes'

Plugin 'nsf/gocode', {'rtp': 'vim/'}
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-notes'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" End Configure Vundle
"
"if ycm_add_preview_to_completeopt = 0 can't work then set cot
set completeopt = "menuone"

"Configure YouCompleteMe
let g:ycm_path_to_python_interpreter = '/Users/veerkat/.virtualenvs/py2vim/bin/python'
"let g:ycm_add_preview_to_completeopt = 1 
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"End

"Configure Startify
"let g:startify_custom_header = []
let g:startify_bookmarks = [ '~/.vimrc' ]
let g:startify_files_number = 6
let g:startify_custom_footer = [
			\'',
			\'',
			\'   I Love the Whole World.',
			\]
"End

"Add NERDTree to Winmanager
let g:NERDTree_title="[NERDTree]" 
function! NERDTree_Start()
	exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
	return 1
endfunction
"let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWindowLayout='NERDTree'
let NERDTreeIgnore = ['\.pyc$']
"end

nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>
"nmap wm :WMToggle<cr>
nmap al :AirlineToggle<cr>

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

nmap tb :Tagbar<cr>
let tagbar_ctags_bin='/usr/local/bin/ctags'
let tagbar_width=25
let g:tagbar_iconchars = ['▸', '▾']


"Configure ultisnips 
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-m>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"
"End

"Configure airline
let g:airline#extensions#tabline#enabled = 1
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
set laststatus=2
set ttimeoutlen=50

"End Configure airline
"
if has("gui_macvim")
    set shell=/bin/bash\ -l
endif

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=5

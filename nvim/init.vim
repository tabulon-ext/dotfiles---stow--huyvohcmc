" https://github.com/huyvohcmc/dotfiles

" Faster loading
let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'
let g:ruby_host_prog = 'rvm system do neovim-ruby-host'

" Plugins will be downloaded under the specified directory
call plug#begin('~/.config/nvim/plugged')
Plug 'justinmk/vim-sneak'
Plug 'justinmk/vim-gtfo'
Plug 'itchyny/lightline.vim'
Plug 'jacoborus/tender.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'wellle/targets.vim'
Plug 'rstacruz/vim-closer'
Plug 'ncm2/ncm2'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-tagprefix'
Plug 'ncm2/ncm2-path'
Plug 'roxma/nvim-yarp'
Plug 'fvictorio/vim-yank-queue'
Plug 'Galooshi/vim-import-js'
call plug#end()

" General settings (see :h vim-differences)
filetype plugin indent on
set autoindent
set autoread
set clipboard=unnamedplus
set completeopt=noinsert,menuone,noselect
set copyindent
set expandtab
set tabstop=2
set shiftwidth=0 " Always have the same value with `tabstop`
set softtabstop=-1 " Always have the same value with `shiftwidth`
set hidden
set history=500
set incsearch hlsearch ignorecase smartcase
set laststatus=2
set ignorecase smartcase
set lazyredraw
set linebreak
set list listchars=tab:.\ ,trail:.
set mouse=""
set nobackup
set noshowmatch
set noshowmode
set noswapfile
set number relativenumber
set ruler rulerformat=%l\:%c
set scrolloff=5
set shortmess+=c
set showcmd
set showtabline=1
set smarttab
set tags=./tags;,tags
set termguicolors
set title
set wildmenu
set wildmode=list:longest,full
set wrap
set ttimeoutlen=0

" Safeguard
if !exists("g:syntax_on")
  syntax enable
endif

" Vim sneak autocmd
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#absolute_dir = 1
map f <Plug>Sneak_s
map F <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Colorscheme
colorscheme tender

" Leader general mapping
let mapleader = ","
nnoremap <leader>w :w<cr>
nnoremap <leader>q :q!<cr>
nnoremap <leader>r :source ~/.config/nvim/init.vim<cr>
nnoremap <silent><leader><cr> :let @/ = ""<cr>
nnoremap <leader>v :vertical resize +10<cr>
nnoremap <leader>V :vertical resize -10<cr>

" Easy navigation
noremap <leader>s <c-w>w
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" NERDTree mapping and config
noremap <leader>n :NERDTreeToggle<CR>
noremap <leader>c :NERDTreeFind<CR>
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeHighlightCursorline = 0
let NERDTreeIgnore = ['^\~$[[dir]]', '^\.o$[[file]]', '^\.pyc$[[file]]', '^\.DS_Store$[[file]]']

" FZF mapping
nnoremap <leader>h :History<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>

" The silver searcher
noremap <leader>ag <esc>:Ag<space>
noremap <leader>aw <esc>:Ag <c-r><c-w>
noremap <leader>ah <esc>:Ag<up><cr>

" Vim-fugitive and vim-rhubarb
noremap <silent> gb :Gblame<CR>
noremap <silent> ghub :Gbrowse<CR>

" Signify config
let g:signify_vcs_list = [ 'git' ]
let g:signify_realtime = 1
let g:signify_sign_show_count = 0
let g:signify_sign_add = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '━'
highlight SignColumn guibg=#282828
highlight SignifySignAdd guifg=#5af78d ctermfg=185
highlight SignifySignChange guifg=#ffc24b ctermfg=153
highlight link SignifySignDelete GitGutterDelete

" Gutentags exclude
let g:gutentags_exclude_project_root = ['/usr/local', '/Users/huyvo']
let g:gutentags_ctags_exclude = ['*.min.js', '*.min.css', 'build', 'vendor', '.git', 'node_modules', '*.vim/bundle/*']

" Enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" LightLine config
let g:lightline = {}
let g:lightline.colorscheme = 'tenderplus'
let g:lightline.component_function = {
      \ 'gitbranch': 'fugitive#head',
      \ }
let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'relativepath', 'modified' ] ],
      \ }

" ALE config
nmap <leader>e <Plug>(ale_fix)
let g:ale_sign_error = '×'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters = { 'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier'] }
let g:ale_fixers = { 'ruby': ['rubocop'], 'javascript': ['prettier'] }

" Set clipboard provider to pbcopy for MacOS
let g:clipboard = {
      \ 'name': 'pbcopy',
      \ 'copy': {
      \    '+': 'pbcopy',
      \    '*': 'pbcopy',
      \  },
      \ 'paste': {
      \    '+': 'pbpaste',
      \    '*': 'pbpaste',
      \ },
      \ 'cache_enabled': 0,
      \ }

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.

call plug#begin()

 "Plug 'nvimdev/dashboard-nvim'
 Plug 'dracula/vim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 Plug 'scrooloose/nerdtree'
 Plug 'preservim/nerdcommenter'
" Plug 'mhinz/vim-startify'
Plug 'https://github.com/neoclide/coc.nvim'
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
 Plug 'ThePrimeagen/harpoon', {'branch' :'harpoon2'}
 Plug 'github/copilot.vim'
 Plug 'mfussenegger/nvim-dap'
 Plug 'nvim-neotest/nvim-nio'
 Plug 'rcarriga/nvim-dap-ui'
 Plug 'w0rp/ale'
 Plug 'OmniSharp/omnisharp-vim'
 Plug 'glepnir/dashboard-nvim'
 call plug#end()

"CoC Settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
 
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
 
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
nnoremap <Leader>f gg=G
nnoremap ; :
vnoremap ; :

"" set shortcut for open Nerdtree
map <C-n> :NERDTreeToggle<CR>

"" Make Nerdtree show .files by default
let NERDTreeShowHidden=1

"" Turn-on dracula color scheme
syntax on
color dracula

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

"How do we add relative line numbering? 
set relativenumber

"Ultisnips Settings
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"OmniSharp Settings
"let g:OmniSharp_server_use_mono = 1
"let g:ale_linters = {
"\ 'cs': ['OmniSharp']
";\}
"let g:ale_cs_mcsc_assemblies = [ '/home/technodromo/Unity/Hub/Editor/2022.3.12f1/Editor/Data/Managed/UnityEngine.dll' ]
"let g:ale_cs_mcsc_assemblies += [ expand(a:path_to_unity_project .'/obj/Debug') ]

"coc-snippets Settings
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

lua require('keybindings')
lua require('dashboard-config')


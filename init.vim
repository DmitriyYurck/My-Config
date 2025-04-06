call plug#begin('~/.vim/plugged')

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/tokyonight.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
call plug#end()

autocmd StdinReadPre * let s:std_in = 1
autocmd VimEnter * NERDTree | wincmd p
autocmd bufenter * if bufname('%') !~ 'NERD_tree_' | NERDTreeToggle | endif
let g:airline_theme = "deus"
syntax on
set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true
  }
}
EOF

inoremap <silent><expr> <C-Space> coc#refresh()
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:AutoPairsMapBS = 1

colorscheme tokyonight-storm
nnoremap <C-n> :NerdTreeToggle<CR>

nnoremap <C-x> :NerdTreeClose<CR>

autocmd bufenter * if bufname('%') == 'NerdTree' | vertical resize 30 | endif
let g:webdevicons_conceal_hide = 1
let g:webdevicons_conceal_hl = 'NerdTreeIcon'
let g:webdevicons_conceal_hl = 'NerdTreeIcon'

let NERDTreeShowHidden=1
let NERDTreeShowLineNumbers=1
let NERDTreeWinSize=25
let NERDTreeMinimalUI=1
let NERDTreeIgnore=['\.git$', '\.hg$', '\.svn$', '\.DS_Store$']

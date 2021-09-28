set number
set relativenumber
colorscheme onedark
call plug#begin('~/.config/nvim/plugged')
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'sheerun/vim-polyglot'
Plug 'neovim/nvim-lspconfig'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'mattn/emmet-vim'
Plug 'ryanoasis/vim-devicons'
Plug 'KabbAmine/vCoolor.vim'
Plug 'romgrk/barbar.nvim'
call plug#end()

" Coc Global "
let g:coc_global_extensions = [
\  'coc-json',
\  'coc-git',
\  'coc-tsserver',
\  'coc-html'
\]


" TREESITTER "
lua <<EOF
require'nvim-treesitter.configs'.setup {
  -- Modules and its options go here
  highlight = { enable = true },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
}
require('lualine').setup{
  options = {theme = 'onedark'}
}
EOF


" SETUP INDENTASI "
set ts=2 sw=2
set expandtab
set textwidth=55
set softtabstop=2
set autoindent
set ruler
set showcmd
set smarttab
set showmatch
set breakindent
set breakindentopt=shift:2,min:40,sbr
set showbreak=  
filetype indent on
autocmd BufRead,BufWritePre *.sh normal gg=G
set fo+=a
set wrap
setlocal wrap

" SETUP NERDTREE "
nnoremap <C-n>, :NvimTreeToggle<CR>
nnoremap <C-r>, :NvimTreeRefresh<CR>
nnoremap <C-f>, :NvimTreeFindFile<CR>
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" TELESCOPE "
nnoremap <C-i>, <cmd>Telescope find_files<cr>
lua <<EOF
    local tree_cb = require'nvim-tree.config'.nvim_tree_callback
    -- default mappings
    vim.g.nvim_tree_bindings = {
      { key = {"<CR>", "o", "<2-LeftMouse>"}, cb = tree_cb("edit") },
      { key = {"<2-RightMouse>", "<C-]>"},    cb = tree_cb("cd") },
      { key = "<C-v>",                        cb = tree_cb("vsplit") },
      { key = "<C-x>",                        cb = tree_cb("split") },
      { key = "<C-o>",                        cb = tree_cb("tabnew") },
      { key = "<",                            cb = tree_cb("prev_sibling") },
      { key = ">",                            cb = tree_cb("next_sibling") },
      { key = "P",                            cb = tree_cb("parent_node") },
      { key = "<BS>",                         cb = tree_cb("close_node") },
      { key = "<S-CR>",                       cb = tree_cb("close_node") },
      { key = "<Tab>",                        cb = tree_cb("preview") },
      { key = "K",                            cb = tree_cb("first_sibling") },
      { key = "J",                            cb = tree_cb("last_sibling") },
      { key = "I",                            cb = tree_cb("toggle_ignored") },
      { key = "H",                            cb = tree_cb("toggle_dotfiles") },
      { key = "<C-r>,",                            cb = tree_cb("refresh") },
      { key = "a",                            cb = tree_cb("create") },
      { key = "d",                            cb = tree_cb("remove") },
      { key = "r",                            cb = tree_cb("rename") },
      { key = "<C-r>",                        cb = tree_cb("full_rename") },
      { key = "x",                            cb = tree_cb("cut") },
      { key = "c",                            cb = tree_cb("copy") },
      { key = "p",                            cb = tree_cb("paste") },
      { key = "y",                            cb = tree_cb("copy_name") },
      { key = "Y",                            cb = tree_cb("copy_path") },
      { key = "gy",                           cb = tree_cb("copy_absolute_path") },
      { key = "[c",                           cb = tree_cb("prev_git_item") },
      { key = "]c",                           cb = tree_cb("next_git_item") },
      { key = "-",                            cb = tree_cb("dir_up") },
      { key = "s",                            cb = tree_cb("system_open") },
      { key = "q",                            cb = tree_cb("close") },
      { key = "g?",                           cb = tree_cb("toggle_help") },
      }
EOF

    " DASBOARD "
    let g:dashboard_default_executive ='telescope'

    " AirLine "
    let bufferline = get(g:, 'bufferline', {})

    let bufferline.icon_separator_active = '▎'
    let bufferline.icon_separator_inactive = '▎'
    let bufferline.icon_close_tab = '©'
    let bufferline.icon_close_tab_modified = '●'
    let bufferline.icon_pinned = '車'
    let bufferline.maximum_length = 20


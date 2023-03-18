"Exit early if running from VSCode
if exists('g:vscode')
    finish
endif

call plug#begin()
" ------ Lualine status bar ------
Plug 'nvim-lualine/lualine.nvim'

" ------ Themes ------
Plug 'tjdevries/colorbuddy.nvim'
Plug 'bbenzikry/snazzybuddy.nvim'
Plug 'AlphaTechnolog/pywal.nvim', { 'as': 'pywal' }
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }

" ------ NERDTree ------
Plug 'scrooloose/nerdtree'

" ------ NERD Commenter ------
Plug 'preservim/nerdcommenter'

" ------ Treesitter ------
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" ------ TABS ------
Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

" ------ Indent Guides ------
Plug 'lukas-reineke/indent-blankline.nvim'

" ------ Nvim autopairs ------
Plug 'windwp/nvim-autopairs'

" ------ Transparent Background ------
Plug 'xiyaowong/nvim-transparent'

" ------ Rainbow parantheses ------
Plug 'p00f/nvim-ts-rainbow'

" ------ Nvim LSP Config ------
Plug 'neovim/nvim-lspconfig'

" ------ coc.nvim ------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ------ QML syntax highlighting for vim ------
Plug 'peterhoeg/vim-qml'

" ------ Git gutter ------
Plug 'airblade/vim-gitgutter'

" ------ Godot Engine integration ------
Plug 'habamax/vim-godot'

" ------ Nvim telescope ------
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

call plug#end()

" ------ Enable filetype plugins ------
filetype plugin on

" ------ Font for neovide ------
set guifont=Victor\ Mono:h14

" ------ Mouse support ------
set mouse=a

" ------ Make split window open at the bottom ------
set splitbelow

" ------ Make background transparent ------
" let g:transparent_enabled = v:true

" Define function to check highlight group under cursor
function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

function CorrectColorScheme()
    highlight Comment gui=italic guifg=LightGreen
    " Set highlighting of symbols to a more visible color 
    highlight link CocHighlightText Search

    " Add a background highlight to matching parantheses
    highlight MatchParen guibg=Gray guifg=White

    " Fix barbar background colors
    highlight BufferCurrent guifg=magenta guibg=none gui=bold
    highlight BufferCurrentIndex guibg=none
    highlight BufferCurrentSign guibg=none 
    highlight BufferCurrentTarget guibg=none 
    highlight BufferCurrentMod guibg=none gui=italic
    highlight BufferVisible guibg=none
    highlight BufferVisibleIndex guibg=none
    highlight BufferVisibleMod guibg=none
    highlight BufferVisibleSign guibg=none
    highlight BufferVisibleTarget guibg=none
    highlight BufferInactive guibg=none
    highlight BufferInactiveIndex guibg=none
    highlight BufferInactiveMod guibg=none
    highlight BufferInactiveSign guibg=none
    highlight BufferInactiveTarget guibg=none
    highlight BufferTabpages guibg=none
    highlight BufferTabpagesFill guibg=none
" Change background color of floating window
    "highlight CocFloating guibg=White
    "highlight CocMenuSel guibg=LightGray

    " Create a highlight group for @decorators
    highlight link Decorator Number
    match Decorator /\%u0040\{1}\a\+\>/

    " Highlight group for TODO:
    highlight TODO gui=bold
    2match TODO /\<TODO\%u003A\{1}/

    " Fix TreeSitter having italics everywhere
    highlight TSVariable gui=NONE
    highlight TSFunction gui=NONE
    highlight TSNumber gui=NONE
    highlight TSFloat gui=NONE
    highlight TSParameter gui=NONE
    highlight TSMethod gui=NONE
endfunction

"Credit joshdick  
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ------ Set the custom colorscheme ------
"set background=light
let g:one_allow_italics = 1
colorscheme catppuccin
autocmd VimEnter * call CorrectColorScheme()
" Enable line numbers on the left
set number

" Enable syntax highlighting
syntax enable
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" ------ Disable nvim's custom cursor ------
"set guicursor= 

" ------ Set vim to highlight cursor's line
set cursorline

" ------ Map the Leader key to Spacebar ------
let mapleader = " "

" ------ Command shortcuts ------
:command EX Explore
:command PI PlugInstall
:command PC PlugClean
:command PU PlugUpdate
:command NT NERDTree
:command TT split | term
:command TSU TSUpdate
:command HI call SynStack()
:command COC CocConfig
:command MDP CocCommand markdown-preview-enhanced.openPreview
" ------ gdscript toolbox commands
:command GDF !gdformat %:p

" ------ Telescope shortcuts ------
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ------ Nerdtree map to Leader + n ------
nmap <silent> <leader>n :NERDTreeToggle<CR>

" ------ Move to previous/next tabs ------
nnoremap <silent>    <C-j> :BufferPrevious<CR>
nnoremap <silent>    <C-k> :BufferNext<CR>

" ------ Close buffer ----
nnoremap <silent>    <C-x> :BufferClose<CR>

" ------ Shortcut for disabling search highlights ------
nnoremap <leader>h :noh<CR>

" ------ Shortcut for next and prev in the quickfix list ------
nnoremap <silent> <C-]> :cn<CR>

" ------ Shortcut for GitGutter hunks
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk

" ------ NERD Commenter keymappings ------
" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" ------ Customize tab icons ------
let bufferline = get(g:, 'bufferline', {})
let bufferline.icons = 'numbers' 
let bufferline.icon_close_tab = 'x'

" ------ Treesitter modules ------
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable    " Disable folding

" =================== COC KEYMAPPINGS ========================
" ************************************************************
" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
" set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use keybindings to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> <leader>dk <Plug>(coc-diagnostic-prev)
nmap <silent> <leader>dj <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <leader>doc to show documentation in preview window.
nnoremap <silent> <leader>doc :call <SID>show_documentation()<CR>

" GitGutter hunk shortcuts
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <leader>da  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <leader>ext  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <leader>com  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <leader>ot  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <leader>ss  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"******************************************************************
"====================END OF COC KEYS===============================


"====================LUA SCRIPT BELOW==============================
lua << EOF
-- Rainbow indent guides
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
}

-- Config for indent_blanklin-- Config for nvim autopairs
require('nvim-autopairs').setup{}

-- Config for treesitter modules
require'nvim-treesitter.configs'.setup {
  highlight = {
    ensure_installed = "maintained",
    sync_install = false,
    enable = true,
    disable = { "" },
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true,-- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil,-- Do not enable for files with more than n lines, int
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

--=================LUALINE DEFAULT CONFIG=========================
require('lualine').setup {
  options = {
    icons_enabled = false,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}

--[[===============LSP CONFIG STUFF===============================
-- pyright config
require'lspconfig'.pyright.setup{}

-- eslint config
require'lspconfig'.eslint.setup{}

-- jedi_language_server config
require'lspconfig'.jedi_language_server.setup{}

-- Nvim lsp suggested config
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { 'pyright', 'eslint', 'jedi_language_server' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end

==============================================================================--]]

EOF

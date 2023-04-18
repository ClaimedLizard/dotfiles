------ Set the font for neovide ------
vim.o.guifont = "Victor Mono:h13"

------ Set the leader key ------
vim.g.mapleader = ' '

------ Indentation options ------
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

------ Disable folding ------
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.opt.foldenable = false

------ Mouse support ------
vim.opt.mouse = 'a'

------ Always show the tabline ------
vim.o.showtabline = 2

------ Line numbers ------
vim.opt.number = true

------ Highlight the cursor's line ------
vim.opt.cursorline = true

------ Set termguicolors if supported ------
vim.opt.termguicolors = true

------ Command shortcuts ------
vim.api.nvim_create_user_command('TSU', 'TSUpdate', {})

vim.api.nvim_create_user_command('GDF', '!gdformat %:p', {})
vim.api.nvim_create_user_command('GDF', '!gdformat %:p', {})

vim.api.nvim_create_user_command('DIFF', 'DiffviewOpen', {})
vim.api.nvim_create_user_command('CIFF', 'DiffviewClose', {})


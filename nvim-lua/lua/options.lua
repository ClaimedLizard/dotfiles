------ Set the leader key ------
vim.g.mapleader = ' '

------ Enable syntax highlighting ------
vim.cmd('syntax enable')

------ Indentation options ------
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

------ Disable folding ------
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.cmd('set nofoldenable')

------ Enable filetype plugins ------
vim.cmd('filetype plugin on')

------ Mouse support ------
vim.opt.mouse = 'a'

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


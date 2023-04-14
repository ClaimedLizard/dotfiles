function CorrectColorScheme()
    -- Set highlighting of symbols to a more visible color
    vim.cmd('highlight link CocHighlightText Search')

    -- Add a background highlight to matching parantheses
    vim.cmd('highlight MatchParen guibg=Gray guifg=White')

    -- Create a highlight group for @decorators
    vim.cmd('highlight link Decorator Number')
    vim.cmd('match Decorator /\%u0040\{1}\a\+\>/')

    -- Highlight group for TODO:
    vim.cmd('highlight TODO gui=bold')
    vim.cmd('2match TODO /\<TODO\%u003A\{1}/')

    -- Fix TreeSitter having italics everywhere
    vim.cmd('highlight TSVariable gui=NONE')
    vim.cmd('highlight TSFunction gui=NONE')
    vim.cmd('highlight TSNumber gui=NONE')
    vim.cmd('highlight TSFloat gui=NONE')
    vim.cmd('highlight TSParameter gui=NONE')
    vim.cmd('highlight TSMethod gui=NONE')
end

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
vim.opt.nofoldenable

------ Enable filetype plugins ------
vim.cmd('filetype plugin on')

------ Mouse support ------
vim.opt.mouse = 'a'

------ Highlight the cursor's line ------
vim.opt.cursorline = true

------ Make background transparent
-- vim.g.transparent_enabled = true

------ Set termguicolors if supported ------
vim.opt.termguicolors = true

------ Set the custom colorscheme ------
-- vim.opt.background = 'dark'
vim.opt.colorscheme = 'catppuccin-mocha'
vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = CorrectColorScheme,
})

------ Command shortcuts ------
vim.api.nvim_create_user_command('PI', 'PlugInstall', {})
vim.api.nvim_create_user_command('PC', 'PlugClean', {})
vim.api.nvim_create_user_command('PU', 'PlugUpdate', {})
vim.api.nvim_create_user_command('TSU', 'TSUpdate', {})

vim.api.nvim_create_user_command('GDF', '!gdformat %:p', {})
vim.api.nvim_create_user_command('GDF', '!gdformat %:p', {})

vim.api.nvim_create_user_command('DIFF', 'DiffviewOpen', {})
vim.api.nvim_create_user_command('CIFF', 'DiffviewClose', {})


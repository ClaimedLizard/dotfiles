function CorrectColorScheme()
    -- Set highlighting of symbols to a more visible color
    vim.cmd('highlight link CocHighlightText Search')

    -- Add a background highlight to matching parantheses
    vim.cmd('highlight MatchParen guibg=Gray guifg=White')

    -- Create a highlight group for @decorators
    -- vim.cmd('highlight link Decorator Number')
    -- vim.cmd('match Decorator /\%u0040\{1}\a\+\>/')

    -- Fix TreeSitter having italics everywhere
    vim.cmd('highlight TSVariable gui=NONE')
    vim.cmd('highlight TSFunction gui=NONE')
    vim.cmd('highlight TSNumber gui=NONE')
    vim.cmd('highlight TSFloat gui=NONE')
    vim.cmd('highlight TSParameter gui=NONE')
    vim.cmd('highlight TSMethod gui=NONE')
end

------ Make background transparent
-- vim.g.transparent_enabled = true

------ Set the custom colorscheme ------
-- vim.opt.background = 'dark'
vim.cmd.colorscheme('catppuccin')
vim.api.nvim_create_autocmd({"VimEnter"}, {
    callback = CorrectColorScheme,
})

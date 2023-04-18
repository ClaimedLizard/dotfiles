function CorrectColorScheme()
    -- Add a background highlight to matching parantheses
    -- vim.api.nvim_set_hl(0, 'MatchParen', { bg='Gray', fg='White' })

    -- Fix Indent Blankline characters being blue
    vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'IndentBlanklineChar' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { link = 'Linenr' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineContextSpaceChar', { link = 'Linenr' })
end

------ Set the custom colorscheme ------
-- vim.opt.background = 'dark'
vim.cmd.colorscheme('nightfox')
vim.api.nvim_create_autocmd({'VimEnter'}, {
    callback = CorrectColorScheme,
})

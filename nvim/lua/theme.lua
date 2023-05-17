function CorrectColorScheme()
    -- Add a background highlight to matching parantheses
    -- vim.api.nvim_set_hl(0, 'MatchParen', { bg='Gray', fg='White' })

    -- Fix Indent Blankline characters being blue
    vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'IndentBlanklineChar' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineChar', { link = 'Whitespace' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineContextSpaceChar', { link = 'Whitespace' })
end

------ Set the custom colorscheme ------
-- vim.opt.background = 'dark'
vim.g.neovide_transparency = 0.97 -- Make neovide transparent

vim.cmd.colorscheme('nightfox')
vim.api.nvim_create_autocmd({'VimEnter'}, {
    callback = CorrectColorScheme,
})

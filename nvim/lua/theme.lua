function CorrectColorScheme()
    -- Add a background highlight to matching parantheses
    vim.api.nvim_set_hl(0, 'MatchParen', { bg='Gray', fg='White' })
    vim.api.nvim_set_hl(0, 'IndentBlanklineSpaceChar', { link = 'Whitespace' })
end

------ Make background transparent
-- vim.g.transparent_enabled = true

------ Set the custom colorscheme ------
-- vim.opt.background = 'dark'
vim.cmd.colorscheme('catppuccin')
vim.api.nvim_create_autocmd({'VimEnter'}, {
    callback = CorrectColorScheme,
})

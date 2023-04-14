local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

------ Telescope keybindings ------
local builtin = require('telescope.builtin')
map('n', '<leader>ff', builtin.find_files, {})
map('n', '<leader>fg', builtin.live_grep, {})
map('n', '<leader>fb', builtin.buffers, {})
map('n', '<leader>fh', builtin.help_tags, {})

------ Barbar move to previous/next tabs, close tab ------
map('n', '<C-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-k>', '<Cmd>BufferNext<CR>', opts)
map('n', 'C-x>', '<Cmd>BufferClose<CR>', opts)

------ NERD Commenter keymappings ------
vim.g.NERDCreateDefaultMappings = 1 -- Create default mappings
vim.g.NERDSpaceDelims = 1 -- Add spaces after comment delimiters by default
vim.g.NERDCompactSexyComs = 1 -- Use compact synax for prettified multi-line comments
vim.g.NERDCommentEmptyLines = 1 -- Allow commenting and inverting empty lines
vim.g.NERDTrimTrailingWhitespace = 1 -- Enable trimming of trailing whitespace when uncommenting
vim.g.NERDToggleCheckAllLines = 1 -- Enable to check all selected lines are commented or not

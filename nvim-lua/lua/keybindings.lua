local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

------ Telescope keybindings ------
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

------ Barbar move to previous/next tabs, close tab ------
map('n', '<C-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-k>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-x>', '<Cmd>BufferClose<CR>', opts)

------ NERD Commenter keymappings ------
vim.api.nvim_set_var("NERDSpaceDelims", 1) -- Add spaces after comment delimiters by default
vim.api.nvim_set_var("NERDCompactSexyComs", 1) -- Use compact synax for prettified multi-line comments
vim.api.nvim_set_var("NERDCommentEmptyLines", 1) -- Allow commenting and inverting empty lines
vim.api.nvim_set_var("NERDTrimTrailingWhitespace", 1) -- Enable trimming of trailing whitespace when uncommenting
vim.api.nvim_set_var("NERDToggleCheckAllLines", 1) -- Enable to check all selected lines are commented or not
map("n", "<leader>ci", ':call nerdcommenter#Comment(0, "toggle")<CR>', opts)
map("v", "<leader>ci", ':call nerdcommenter#Comment(0, "toggle")<CR>', opts) 

------ Nvim tree keymappings
map('n', '<leader>n', '<Cmd>NvimTreeToggle<CR>', opts)

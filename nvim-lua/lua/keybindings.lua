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

------ Nvim tree keymappings ------
map('n', '<leader>n', '<Cmd>NvimTreeToggle<CR>', opts)

------ Lsp config global mappings.------
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>er', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>eq', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})

-- Hop nvim easy motion keybindings
map('n', 'HL', '<Cmd>HopLine<CR>', opts)
map('n', 'HW', '<Cmd>HopWord<CR>', opts)


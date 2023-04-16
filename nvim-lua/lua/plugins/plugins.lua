return {
    'kyazdani42/nvim-web-devicons', -- Cool icons
    'nvim-lualine/lualine.nvim', -- Lualine status bar
    { 'catppuccin/nvim', name = 'catppuccin' }, --Catppuccin colorscheme
    'preservim/nerdcommenter', --NERD Commenter
    'nvim-treesitter/nvim-treesitter', -- Treesitter
    'nvim-tree/nvim-tree.lua', -- NERDTree for nvim
    'romgrk/barbar.nvim', -- Barbar
    'lukas-reineke/indent-blankline.nvim', -- Indent Guides
    'windwp/nvim-autopairs', -- Nvim autopairs
    'xiyaowong/nvim-transparent', -- Transparent background
    'HiPhish/nvim-ts-rainbow2', -- Rainbow parantheses
    'neovim/nvim-lspconfig', -- Nvim LSP config
    'lewis6991/gitsigns.nvim', -- Git signs
    'habamax/vim-godot', -- Godot Engine integration
    { 'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' } }, -- Nvim telescope
    'sindrets/diffview.nvim', -- Diffview
    { 'akinsho/toggleterm.nvim', version = "*", config = true }, -- Toggleterm
    'tpope/vim-fugitive', -- Vim Fugitive, so good it should be illegal
    'neovim/nvim-lspconfig', -- Ready-made lsp configuration
    'hrsh7th/cmp-nvim-lsp', -- Nvim cmp autocompletion
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    'L3MON4D3/LuaSnip', -- Luasnip for code snippets
    'saadparwaiz1/cmp_luasnip',
    'phaazon/hop.nvim', -- Hop for easy motions
    {
        "williamboman/mason.nvim", -- Mason for managing LSP server installs
        build = ":MasonUpdate" -- :MasonUpdate updates registry contents
    },
    { 'williamboman/mason-lspconfig.nvim', dependencies = { 'williamboman/mason.nvim' } },
    'mfussenegger/nvim-lint' -- Nvim-lint for linting support
}

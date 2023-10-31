return {
    { 'akinsho/toggleterm.nvim', version = "*", config = true }, -- Toggleterm

    'andrewferrier/wrapping.nvim', -- Wrapping for soft or hard wrapping modes

    { 'catppuccin/nvim', name = 'catppuccin' }, -- Catppuccin colorscheme

    'folke/zen-mode.nvim', -- Zen mode

    'habamax/vim-godot', -- Godot Engine integration

    'hrsh7th/cmp-buffer', -- Nvim cmp autocompletion
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/nvim-cmp',

    'kyazdani42/nvim-web-devicons', -- Cool icons

    'lewis6991/gitsigns.nvim', -- Git signs

    'lukas-reineke/indent-blankline.nvim', -- Indent Guides

    'mfussenegger/nvim-lint', -- Nvim-lint for linting support

    'nanozuki/tabby.nvim', -- Tabby tab bar

    'neovim/nvim-lspconfig', -- Ready-made lsp configuration

    'numToStr/Comment.nvim', -- Nvim comment toggler

    'nvim-lualine/lualine.nvim', -- Lualine status bar

    { 'nvim-telescope/telescope.nvim', tag = '0.1.4', dependencies = { 'nvim-lua/plenary.nvim' } }, -- Nvim telescope

    'nvim-tree/nvim-tree.lua', -- NERDTree for nvim

    'nvim-treesitter/nvim-treesitter', -- Treesitter

    'phaazon/hop.nvim', -- Hop for easy motions

    'saadparwaiz1/cmp_luasnip', -- Luasnip integration into cmp

    'briones-gabriel/darcula-solid.nvim', -- Darcula colorscheme
    'rktjmp/lush.nvim', -- Requirement for Darcula colorscheme

    'sindrets/diffview.nvim', -- Diffview

    'tpope/vim-fugitive', -- Vim Fugitive, so good it should be illegal

    'windwp/nvim-autopairs', -- Nvim autopairs

    { "williamboman/mason.nvim", build = ":MasonUpdate" }, -- Mason for managing LSP installs
    { 'williamboman/mason-lspconfig.nvim', dependencies = { 'williamboman/mason.nvim' } },

    'EdenEast/nightfox.nvim', -- Nightfox colorscheme

    'HiPhish/nvim-ts-rainbow2', -- Rainbow parantheses

    'L3MON4D3/LuaSnip', -- Luasnip for code snippets
}

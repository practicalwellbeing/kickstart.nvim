-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {

  {
    'maxmx03/solarized.nvim',
    lazy = false,
    priority = 1000,
    -- config = function()
    --   vim.o.background = 'light' -- or 'light'
    --   vim.cmd.colorscheme 'solarized'
    -- end,
  },

  {
    'folke/trouble.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- floating terminal
  {
    'voldikss/vim-floaterm',
  },

  {
    'lewis6991/gitsigns.nvim',

    config = function()
      require('gitsigns').setup()
    end,
  },

  {
    'coffebar/neovim-project',
    opts = {
      projects = { -- define project roots
        '~/git/*',
        '~/.config/*',
      },
    },
    init = function()
      -- enable saving the state of plugins in the session
      vim.opt.sessionoptions:append 'globals' -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope.nvim', tag = '0.1.4' },
      { 'Shatur/neovim-session-manager' },
    },
    lazy = false,
    priority = 100,
  },

  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      'rcarriga/nvim-notify',
    },
  },

  -- {
  --   'nvim-lualine/lualine.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   require('lualine').setup(),
  -- },

  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    opts = {},
    keys = {
      {
        '<leader>up',
        function()
          local Util = require 'lazy.core.util'
          vim.g.minipairs_disable = not vim.g.minipairs_disable
          if vim.g.minipairs_disable then
            Util.warn('Disabled auto pairs', { title = 'Option' })
          else
            Util.info('Enabled auto pairs', { title = 'Option' })
          end
        end,
        desc = 'Toggle auto pairs',
      },
    },
  },

  {
    'https://git.sr.ht/~swaits/scratch.nvim',
    lazy = true,
    keys = {
      { '<leader>bx', '<cmd>Scratch<cr>', desc = 'Scratch Buffer', mode = 'n' },
      { '<leader>bX', '<cmd>ScratchSplit<cr>', desc = 'Scratch Buffer (split)', mode = 'n' },
      -- for quick access
      { '<leader>x', '<cmd>Scratch<cr>', desc = 'Scratch Buffer', mode = 'n' },
    },
    cmd = {
      'Scratch',
      'ScratchSplit',
    },
    opts = {},
  },
}

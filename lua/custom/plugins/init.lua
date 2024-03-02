-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {

  -- {
  --   'navarasu/onedark.nvim',
  --   require('onedark').load(),
  -- },
  {
    'preservim/vim-markdown',
    ft = 'markdown',
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
      vim.g.vim_markdown_no_default_key_mappings = 0
      vim.g.vim_markdown_conceal_code_blocks = 0
      vim.g.vim_markdown_math = 1
      vim.g.tex_conceal = 'abmgs'
      vim.g.vim_markdown_conceal = 2 -- 1 to disable
      vim.g.vim_markdown_toc_autofit = 1
      vim.g.vim_markdown_follow_anchor = 0
      vim.g.vim_markdown_toml_frontmatter = 1
      vim.g.vim_markdown_strikethrough = 1
    end,
  },

  {
    'folke/persistence.nvim',
    event = 'BufReadPre',
    opts = { options = vim.opt.sessionoptions:get() },
  -- stylua: ignore
  keys = {
      { "<leader>qs", function() require("persistence").load() end, desc = "Restore Session" },
      { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "Restore Last Session" },
      { "<leader>qd", function() require("persistence").stop() end, desc = "Don't Save Current Session" },
    },
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

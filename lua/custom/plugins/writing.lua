-- plugins to do with text writing

return {

  {
    'stevearc/aerial.nvim',
    opts = {
      layout = {
        max_width = 0.4,
        min_width = 0.2,
      },
    },
    -- Optional dependencies
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      {
        '<leader>ta',
        '<cmd>AerialToggle!<cr>', -- ! forces cursor to stay in original window
        desc = 'Toggle Aerial',
      },
    },
  },

  {
    -- https://github.com/ixru/nvim-markdown
    'ixru/nvim-markdown',
    -- need to add some keymaps here
  },

  -- nvim alternative to Pencil
  --https://github.com/andrewferrier/wrapping.nvim
  {
    'andrewferrier/wrapping.nvim',
    opts = {},
    config = function()
      require('wrapping').setup {
        softener = { markdown = true },
      }
    end,
  },

  {
    'folke/zen-mode.nvim',
    opts = {

      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      window = {
        backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 100, -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
      },
      -- on_open = function(win)
      -- "<cmd>SoftPencil<cr>"
      -- end,
      -- on_close = function(win)
      -- "<cmd>PencilOff<cr>"
      -- end,
    },

    keys = {
      {
        '<leader>tz',
        '<cmd>ZenMode<cr>',
        desc = 'Toggle ZenMode',
      },
    },
  },

  {
    'folke/twilight.nvim',
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      dimming = {
        alpha = 0.70, -- amount of dimming
        -- we try to get the foreground from the highlight groups or fallback color
        color = { 'Normal', '#ffffff' },
        term_bg = '#000000', -- if guibg=NONE, this will be used to calculate text color
        inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
      },
      context = 5, -- amount of lines we will try to show around the current line
      treesitter = false, -- use treesitter when available for the filetype
      -- treesitter is used to automatically expand the visible text,
      -- but you can further control the types of nodes that should always be fully expanded
      expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
        'function',
        'method',
        'table',
        'if_statement',
      },
      exclude = {}, -- exclude these filetypes
    },
  },

  -- markdown preview
  {
    'iamcco/markdown-preview.nvim',
    enabled = true,
    lazy = false,
    keys = {
      { '<leader>tm', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Toggle Markdown Preview' },
      { '<leader>mp', '<cmd>MarkdownPreview<cr>', desc = 'Markdown Preview' },
      { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', desc = 'Markdown Stop Preview' },
    },
    ft = { 'wiki', 'markdown', 'md', 'puml' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}

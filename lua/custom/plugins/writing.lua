-- plugins to do with text writing

return {
  -- {
  --   'nvim-treesitter/nvim-treesitter',
  --   dependencies = { 'tadmccorkle/markdown.nvim' },
  --   config = function()
  --     require('nvim-treesitter.configs').setup {
  --       ensure_installed = {
  --         'markdown',
  --         'markdown_inline', --[[ other parsers you need ]]
  --       },
  --       markdown = {
  --         enable = true,
  --         -- configuration here or nothing for defaults
  --       },
  --     }
  --   end,
  -- },
  -- disabled because of persistent 'timer' alerts
  -- {
  --   'epwalsh/obsidian.nvim',
  --   version = '*', -- recommended, use latest release instead of latest commit
  --   lazy = true,
  --   ft = 'markdown',
  --   -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  --   -- event = {
  --   --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   --   "BufReadPre path/to/my-vault/**.md",
  --   --   "BufNewFile path/to/my-vault/**.md",
  --   -- },
  --   dependencies = {
  --     -- Required.
  --     'nvim-lua/plenary.nvim',
  --
  --     -- see below for full list of optional dependencies 👇
  --   },
  --   opts = {
  --     workspaces = {
  --       {
  --         name = 'Vault',
  --         path = '~/obsidian/Vault',
  --       },
  --       {
  --         name = 'Digital Garden',
  --         path = '~/obsidian/Digital Garden',
  --       },
  --     },
  --
  --     -- see below for full list of options 👇
  --   },
  --
  --   note_id_func = function(title)
  --     return tostring(title)
  --   end,
  -- },

  -- {
  --
  --   'dhananjaylatkar/notes.nvim',
  --   dependencies = {
  --     'nvim-telescope/telescope.nvim',
  --   },
  --   opts = {
  --     -- USE EMPTY FOR DEFAULT OPTIONS
  --     -- DEFAULTS ARE LISTED BELOW
  --     root = os.getenv 'HOME' .. '/pCloudDrive/pCloudSync/wiki/',
  --   },
  -- },

  -- table of contents 'preview'
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
    'MeanderingProgrammer/markdown.nvim',
    name = 'render-markdown', -- Only needed if you have another plugin named markdown.nvim
    dependencies = { 'nvim-treesitter/nvim-treesitter' },

    keys = {
      {
        '<leader>tr',
        '<cmd>RenderMarkdowToggle<cr>', -- ! forces cursor to stay in original window
        desc = 'Toggle RenderMarkdown',
      },
    },
    config = function()
      require('render-markdown').setup {}
    end,
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

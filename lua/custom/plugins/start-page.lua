return {
  'echasnovski/mini.starter',
  version = false, -- wait till new 0.7.0 release to put it back on semver
  event = 'VimEnter',
  opts = function()
    local logo = table.concat({}, '\n')
    local pad = string.rep(' ', 10)
    local new_section = function(name, action, section)
      return { name = name, action = action, section = pad .. section }
    end

    local starter = require 'mini.starter'
      --stylua: ignore
      local config = {
        evaluate_single = true,
       header = table.concat({
  		[[  /\ \▔\___  ___/\   /(●)_ __ ___  ]],
  		[[ /  \/ / _ \/ _ \ \ / / | '_ ` _ \ ]],
  		[[/ /\  /  __/ (_) \ V /| | | | | | |]],
  		[[\_\ \/ \___|\___/ \_/ |_|_| |_| |_|]],
  		[[───────────────────────────────────]],
  	}, "\n"),
        items = {
          new_section("Find file",       "Telescope find_files",                                   "Telescope"),
          new_section("Recent files",    "Telescope oldfiles",                                     "Telescope"),
          new_section("Grep text",       "Telescope live_grep",                                    "Telescope"),
          new_section("Options",          "lua require('telescope.builtin').find_files({ cwd = vim.fn.stdpath 'config' })", "Options"),
          new_section("Lazy",             "Lazy", "Options"),
          new_section("Projects",        "Telescope neovim-project history",                       "Session"),
          new_section("Session restore", [[lua require("persistence").load()]],                    "Session"),
          new_section("New file",        "ene | startinsert",                                      "Built-in"),
          new_section("Quit",            "qa",                                                     "Built-in"),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet(pad .. "░ ", false),
          starter.gen_hook.aligning("center", "center"),
        },
      }
    return config
  end,
  config = function(_, config)
    -- close Lazy and re-open when starter is ready
    if vim.o.filetype == 'lazy' then
      vim.cmd.close()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'MiniStarterOpened',
        callback = function()
          require('lazy').show()
        end,
      })
    end

    local starter = require 'mini.starter'
    starter.setup(config)

    vim.api.nvim_create_autocmd('User', {
      pattern = 'LazyVimStarted',
      callback = function()
        local stats = require('lazy').stats()
        local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
        local pad_footer = string.rep(' ', 8)
        starter.config.footer = pad_footer .. '⚡ Neovim loaded ' .. stats.count .. ' plugins in ' .. ms .. 'ms'
        pcall(starter.refresh)
      end,
    })
  end,
}

return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- Dashboard configuration
    dashboard = {
      enabled = true,
      width = 60,
      row = nil, -- center position
      col = nil, -- center position
      pane_gap = 4,
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",

      preset = {
        -- Custom keybindings for dashboard
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },

        -- ASCII art header
        header = [[
     ██╗ ██████╗ ███████╗███████╗
     ██║██╔═══██╗██╔════╝██╔════╝
   ██║██║   ██║███████╗█████╗
   ██║██║   ██║╚════██║██╔══╝
╚█████╔╝╚██████╔╝███████║███████╗
 ╚════╝  ╚═════╝ ╚══════╝╚══════╝
        ]],
      },

      -- Dashboard sections layout
      sections = {
        { section = "header" },
        { icon = " ", title = "Keymaps", section = "keys", indent = 2, padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { section = "startup" },
      },
    },

    -- Other useful snacks features you might want
    bigfile = { enabled = true }, -- Handle big files better
    notifier = { enabled = true }, -- Better notifications
    quickfile = { enabled = true }, -- Faster file opening
    statuscolumn = { enabled = true }, -- Better status column
    words = { enabled = true }, -- Highlight word under cursor
  },
}

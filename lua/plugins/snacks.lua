return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  config = function()
    -- Setup custom highlight groups for dashboard with rainbow gradient
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader1", { fg = "#f38ba8", bold = true }) -- Catppuccin red
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader2", { fg = "#fab387", bold = true }) -- Catppuccin peach
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader3", { fg = "#f9e2af", bold = true }) -- Catppuccin yellow
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader4", { fg = "#a6e3a1", bold = true }) -- Catppuccin green
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader5", { fg = "#89b4fa", bold = true }) -- Catppuccin blue
    vim.api.nvim_set_hl(0, "SnacksDashboardHeader6", { fg = "#cba6f7", bold = true }) -- Catppuccin mauve

    vim.api.nvim_set_hl(0, "SnacksDashboardKey", { fg = "#89b4fa", bold = true })    -- Catppuccin blue
    vim.api.nvim_set_hl(0, "SnacksDashboardDesc", { fg = "#cdd6f4" })                -- Catppuccin text
    vim.api.nvim_set_hl(0, "SnacksDashboardIcon", { fg = "#f38ba8" })                -- Catppuccin red
    vim.api.nvim_set_hl(0, "SnacksDashboardFooter", { fg = "#a6e3a1", italic = true }) -- Catppuccin green

    require("snacks").setup({
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
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },

      -- Dashboard sections layout
      sections = {
        -- Rainbow gradient header (red → peach → yellow → green → blue → mauve)
        {
          text = {
            { "     ███╗   ██╗ ███████╗  ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗", hl = "SnacksDashboardHeader1" },
          },
          align = "center",
        },
        {
          text = {
            { "     ████╗  ██║ ██╔════╝ ██╔═══██╗ ██║   ██║ ██║ ████╗ ████║", hl = "SnacksDashboardHeader2" },
          },
          align = "center",
        },
        {
          text = {
            { "     ██╔██╗ ██║ █████╗   ██║   ██║ ██║   ██║ ██║ ██╔████╔██║", hl = "SnacksDashboardHeader3" },
          },
          align = "center",
        },
        {
          text = {
            { "     ██║╚██╗██║ ██╔══╝   ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║", hl = "SnacksDashboardHeader4" },
          },
          align = "center",
        },
        {
          text = {
            { "     ██║ ╚████║ ███████╗ ╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║", hl = "SnacksDashboardHeader5" },
          },
          align = "center",
        },
        {
          text = {
            { "     ╚═╝  ╚═══╝ ╚══════╝  ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝", hl = "SnacksDashboardHeader6" },
          },
          align = "center",
          padding = 2,
        },
        { section = "keys", indent = 2, padding = 3, gap = 1 },
        { section = "startup" },
        {
          text = {
            { "  Code with purpose, build with passion  ", hl = "SnacksDashboardFooter" },
          },
          padding = 1,
          align = "center",
        },
      },
    },

      -- Other useful snacks features you might want
      bigfile = { enabled = true }, -- Handle big files better
      notifier = { enabled = true }, -- Better notifications
      quickfile = { enabled = true }, -- Faster file opening
      statuscolumn = { enabled = true }, -- Better status column
      words = { enabled = true }, -- Highlight word under cursor
    })
  end,
}

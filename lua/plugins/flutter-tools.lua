return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      lsp = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      },
      debugger = {
        enabled = false, -- Set to true if you want debugging support
      },
      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        enabled = true,
        highlight = "Comment",
      },
      dev_log = {
        enabled = true,
        notify_errors = false,
      },
      outline = {
        open_cmd = "30vnew",
      },
    })

    -- Keymaps for Flutter
    vim.keymap.set("n", "<leader>fr", ":FlutterRun<CR>", { desc = "Flutter Run" })
    vim.keymap.set("n", "<leader>fq", ":FlutterQuit<CR>", { desc = "Flutter Quit" })
    vim.keymap.set("n", "<leader>fR", ":FlutterReload<CR>", { desc = "Flutter Reload" })
    vim.keymap.set("n", "<leader>fD", ":FlutterDevices<CR>", { desc = "Flutter Devices" })
    vim.keymap.set("n", "<leader>fe", ":FlutterEmulators<CR>", { desc = "Flutter Emulators" })
    vim.keymap.set("n", "<leader>fo", ":FlutterOutline<CR>", { desc = "Flutter Outline" })
  end,
}

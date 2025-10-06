return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        -- Flutter (Dart has built-in formatter via LSP)
        dart = { "dart_format" },
        -- Next.js/Nest.js/Vue.js
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        -- Web
        css = { "prettier" },
        html = { "prettier" },
        -- Config/Data
        json = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        prisma = { "prettier" },
        -- Neovim config
        lua = { "stylua" },
        -- DevOps
        sh = { "shfmt" },
        bash = { "shfmt" },
        dockerfile = { "prettier" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 500,
      },
    })

    -- Keymap for manual formatting
    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range" })
  end,
}

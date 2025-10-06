return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint")

    lint.linters_by_ft = {
      -- Flutter (Dart analysis via LSP)
      -- Next.js/Nest.js/Vue.js
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      vue = { "eslint_d" },
      -- Markdown
      markdown = { "markdownlint-cli2" },
      -- DevOps
      dockerfile = { "hadolint" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
    }

    -- Auto-lint on save and text change
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Manual lint keymap
    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, { desc = "Trigger linting" })
  end,
}

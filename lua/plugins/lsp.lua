return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Keybindings for LSP
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
      vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show hover documentation" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code action" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostics" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

      -- Setup mason-lspconfig
      mason_lspconfig.setup({
        ensure_installed = {
          -- Next.js/Nest.js/Vue.js
          "ts_ls",
          "vuels", -- Vue.js Language Server
          "eslint",
          -- Web
          "html",
          "cssls",
          "tailwindcss",
          -- Config/Data
          "jsonls",
          "yamlls",
          "prismals",
          "marksman", -- Markdown LSP
          -- DevOps
          "dockerls",
          "docker_compose_language_service",
          -- Neovim config
          "lua_ls",
        },
      })

      -- Configure lua_ls with custom settings using vim.lsp.config
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })

      -- Setup other servers with default config using vim.lsp.config
      local servers = {
        "ts_ls",
        "vuels",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
        "jsonls",
        "yamlls",
        "prismals",
        "marksman",
        "dockerls",
        "docker_compose_language_service",
      }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- Enable LSP servers
      vim.lsp.enable({
        "lua_ls",
        "ts_ls",
        "vuels",
        "eslint",
        "html",
        "cssls",
        "tailwindcss",
        "jsonls",
        "yamlls",
        "prismals",
        "marksman",
        "dockerls",
        "docker_compose_language_service",
      })
    end,
  },
}

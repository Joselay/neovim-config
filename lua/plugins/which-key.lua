return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    preset = "modern",
  },
  config = function()
    local wk = require("which-key")
    wk.setup({
      preset = "modern",
    })

    -- Register leader key groups for better organization
    wk.add({
      { "<leader>f", group = "Find" },
      { "<leader>s", group = "Split" },
      { "<leader>t", group = "Tab" },
      { "<leader>b", group = "Buffer" },
      { "<leader>h", group = "Git Hunk" },
      { "<leader>c", group = "Code" },
      { "<leader>g", group = "Git" },
      { "<leader>n", group = "No" },
      { "<leader>m", group = "Format" },
    })
  end,
}

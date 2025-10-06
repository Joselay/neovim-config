return {
  "3rd/image.nvim",
  build = false, -- recommended per official docs
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    backend = "kitty", -- Ghostty supports Kitty Graphics Protocol
    processor = "magick_cli", -- Use ImageMagick CLI
    integrations = {
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = false, -- Show all images in markdown
        filetypes = { "markdown", "vimwiki" },
      },
    },
    max_width = nil,
    max_height = nil,
    max_width_window_percentage = nil,
    max_height_window_percentage = 50,
    window_overlap_clear_enabled = false,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign" },
    hijack_file_patterns = { "*.png", "*.jpg", "*.jpeg", "*.gif", "*.webp", "*.avif" },
  },
}

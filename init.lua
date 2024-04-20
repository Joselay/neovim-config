vim.o.shell = "pwsh.exe"
-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

-- Helper function for transparency formatting
local alpha = function()
    return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
  end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  vim.g.neovide_transparency = 0.8
  vim.g.transparency = 0
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
--   vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_opacity = 300.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 1.5
  vim.g.neovide_cursor_vfx_particle_density = 95.0
  vim.g.neovide_cursor_vfx_particle_speed = 50.0
--   vim.g.neovide_cursor_vfx_particle_phase = 1.5
--   vim.g.neovide_cursor_vfx_particle_curl = 1.0








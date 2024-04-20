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
  vim.o.guifont = "Operator Mono:h14:i" -- text below applies for VimScript

  vim.g.neovide_scale_factor = 1.0
local change_scale_factor = function(delta)
  vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
end
vim.keymap.set("n", "<C-=>", function()
  change_scale_factor(1.25)
end)
vim.keymap.set("n", "<C-->", function()
  change_scale_factor(1/1.25)
end)


  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = true
 
--   vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_cursor_vfx_opacity = 300.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 4.5
  vim.g.neovide_cursor_vfx_particle_density = 165.0
  vim.g.neovide_cursor_vfx_particle_speed = 50.0
--   vim.g.neovide_cursor_vfx_particle_phase = 1.5
--   vim.g.neovide_cursor_vfx_particle_curl = 1.0


  





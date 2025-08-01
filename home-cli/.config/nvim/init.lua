-- Disable validation for speed
---@diagnostic disable-next-line: duplicate-set-field
vim.validate = function() end

-- Enable faster lua loader using byte-compilation
-- https://github.com/neovim/neovim/commit/2257ade3dc2daab5ee12d27807c0b3bcf103cd29
vim.loader.enable()

_G.settings = {
  ui = {
    border = 'solid',
    border_preview = 'solid',
    border_input = 'rounded',
    background = 'dark',
    colorscheme = 'catppuccin-mocha',
  },
}

vim.g.has_ui = #vim.api.nvim_list_uis() > 0
vim.g.has_gui = vim.g.has_ui
  and (vim.env.DISPLAY ~= nil or vim.env.WAYLAND_DISPLAY ~= nil)

require('core.opts')
require('core.mappings')
require('core.autocmds')
require('core.lsp')
require('core.diagnostic')
require('core.plugins')

vim.go.bg = settings.ui.background

if not vim.g.has_gui then
  if vim.g.has_ui then
    vim.cmd.colorscheme('default')
  end
  return
end

vim.cmd.colorscheme({
  args = { settings.ui.colorscheme },
  mods = { emsg_silent = true },
})

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.ccm/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.winbar = "%=%m %f"

vim.api.nvim_set_hl(0, "WinBarNC", { bg = "#1e2030", fg = "#636da6" })
vim.api.nvim_set_hl(0, "WinBar", { bg = "#2d3f76", fg = "#c8d3f5", bold = true })

-- LSP Server to use for Ruby.
vim.g.lazyvim_ruby_formatter = "rubocop"
vim.g.lazyvim_ruby_lsp = "ruby_lsp"

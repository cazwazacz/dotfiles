-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<leader>sx", function()
  require("telescope.builtin").resume()
end, { noremap = true, silent = true, desc = "Resume" })

--

vim.keymap.set("n", "<leader>fs", function()
  vim.cmd("w")
end, { noremap = true, silent = true, desc = "Save file" })

-- Copy relative file path
vim.keymap.set("n", "<leader>yr", function()
  vim.fn.setreg("+", vim.fn.expand("%"))
  vim.notify("Copied relative path: " .. vim.fn.expand("%"))
end, { desc = "Yank relative file path" })

-- Copy absolute file path
vim.keymap.set("n", "<leader>ya", function()
  vim.fn.setreg("+", vim.fn.expand("%:p"))
  vim.notify("Copied absolute path: " .. vim.fn.expand("%:p"))
end, { desc = "Yank absolute file path" })

-- Copy file path with line number
vim.keymap.set("n", "<leader>yl", function()
  local path = vim.fn.expand("%") .. ":" .. vim.fn.line(".")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Yank file path with line number" })

-- Copy file path with line and column
vim.keymap.set("n", "<leader>yL", function()
  local path = vim.fn.expand("%") .. ":" .. vim.fn.line(".") .. ":" .. vim.fn.col(".")
  vim.fn.setreg("+", path)
  vim.notify("Copied: " .. path)
end, { desc = "Yank file path with line and column" })

-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("plugins.python_dev")

vim.opt.clipboard = "unnamedplus"
vim.o.mouse = "r"

vim.opt.clipboard:append("unnamedplus")
vim.opt.mousemoveevent = true

vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- TO copy automatically to clipboard
-- vim.keymap.set({ "n", "v" }, "<LeftRelease>", [["+y<LeftRelease>]], { silent = true })
-- to copy with Control V
vim.keymap.set("i", "<C-c>", '<Esc>"+yi', { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", function()
  local term_buf = vim.fn.bufnr("term://*")
  if term_buf ~= -1 then
    local win = vim.fn.bufwinnr(term_buf)
    if win ~= -1 then
      vim.cmd(win .. "close")
    else
      vim.cmd("sbuffer " .. term_buf)
      vim.cmd("resize 15")
    end
  else
    vim.cmd("15split | terminal")
  end
end, { noremap = true, silent = true })

-- Ensure Ctrl-J works in terminal mode to toggle as well
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-j>", { noremap = true, silent = true })

-- to have o as jump forward and i as jump backward
vim.keymap.set("n", "<C-i>", "<C-o>", { noremap = true, desc = "Jump backward" })
vim.keymap.set("n", "<C-o>", "<C-i>", { noremap = true, desc = "Jump forward" })

-- Add to your config/lua/config/keymaps.lua
vim.keymap.set("n", "<C-z>", "u", { silent = true }) -- Normal mode undo
vim.keymap.set("i", "<C-z>", "<C-o>u", { silent = true }) -- Insert mode undo

-- You might also want Ctrl+Shift+Z for redo
vim.keymap.set("n", "<C-S-z>", "<C-r>", { silent = true }) -- Normal mode redo
vim.keymap.set("i", "<C-S-z>", "<C-o><C-r>", { silent = true }) -- Insert mode redo

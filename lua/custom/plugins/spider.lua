-- Add the plugin (string form is fine for simple cases)
vim.pack.add({
  "https://github.com/chrisgrieser/nvim-spider",
})

-- Your keymaps (run immediately since lazy = false in the original)
vim.keymap.set({ "n", "o", "x" }, "W", "<cmd>lua require('spider').motion('w')<CR>", { desc = "Spider-w" })
vim.keymap.set({ "n", "o", "x" }, "E", "<cmd>lua require('spider').motion('e')<CR>", { desc = "Spider-e" })
vim.keymap.set({ "n", "o", "x" }, "B", "<cmd>lua require('spider').motion('b')<CR>", { desc = "Spider-b" })
vim.keymap.set({ "n", "o", "x" }, "gE", "<cmd>lua require('spider').motion('ge')<CR>", { desc = "Spider-ge" })

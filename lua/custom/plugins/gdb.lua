vim.pack.add({ "https://github.com/sakhnik/nvim-gdb" })

-- Your custom keymap (the plugin loads at startup, so this is fine)
vim.keymap.set({"n", "o", "x"}, "<leader>di", "<cmd>GdbInterrupt<CR>", { desc = "gdb interrupt" })

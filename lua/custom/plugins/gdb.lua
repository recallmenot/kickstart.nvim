return {
	"sakhnik/nvim-gdb",
	lazy = false,
	config = function()
		vim.keymap.set({"n", "o", "x"}, "<leader>di", "<cmd>GdbInterrupt<CR>", { desc = "gdb interrupt" })
	end
}

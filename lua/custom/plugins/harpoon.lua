return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	lazy = false,
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup()
		vim.keymap.set('n', '<leader>:', function() harpoon:list():append() end, { desc = "harpoon add" })
		vim.keymap.set("n", '<leader>.', function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "harpoon list" })
	end
}

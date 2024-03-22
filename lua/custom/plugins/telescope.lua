return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.6',
	dependencies = { 'nvim-lua/plenary.nvim' },
	lazy = false,
	config = function()
		local builtin = require('telescope.builtin')
		vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "telescope find file" })
		vim.keymap.set('n', '<leader>fg', builtin.grep_string, { desc = "telescope grep" })
		vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "telescope buffers" })
		vim.keymap.set('n', '<leader>fr', builtin.git_files, { desc = "telescope git repository" })
	end
}

-- Add the plugin (use a table because we want to specify the branch)
vim.pack.add {
  { src = 'https://github.com/mbbill/undotree', branch = 'master' },
}

-- Configuration / keymap (runs immediately since it's not lazy-loaded)
vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = "undotree" })

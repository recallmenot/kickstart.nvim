return {
  'FabijanZulj/blame.nvim',
  branch = 'main',
  dependencies = { 'nvim-lua/plenary.nvim' },
  lazy = false,
  config = function()
    require('blame').setup {
      date_format = '%Y.%m.%d',
    }
    vim.keymap.set('n', '<leader>gb', '<cmd>BlameToggle<CR>', { desc = 'toggle blame' })
  end,
  opts = {
    blame_options = { '-w' },
  },
}

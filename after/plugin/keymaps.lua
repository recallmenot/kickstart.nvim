-- Move visual selection up/down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'move selection down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'move selection up' })

-- Replace current word
vim.keymap.set('n', '<leader>rc', [[:%s/<C-r><C-w>/<C-r><C-w>/gi<Left><Left><Left>]],
  { desc = 'replace the current word in this document' })

-- Treesitter folds
vim.keymap.set(
  { 'n', 'o', 'x' },
  'zF',
  ':set foldmethod=expr <CR> :set foldexpr=nvim_treesitter#foldexpr() <CR> :set foldmethod=manual <CR>',
  { desc = 'treesitter: generate folds' }
)

-- Change working directory
vim.keymap.set('n', '<leader>gc', ':cd %:h<CR>', { noremap = true, silent = true, desc = 'set CWD to parent of current file' })

-- Clean trailing whitespace and ^M
vim.keymap.set('n', '<leader>cr', function()
  local save_cursor = vim.fn.getpos '.'
  vim.cmd [[%s/\s\+$//e]]
  vim.cmd [[%s/\r//ge]]
  vim.fn.setpos('.', save_cursor)
  print 'Cleaned: trailing whitespace and carriage returns (^M) removed'
end, { desc = 'Clean: rm trailing whitespace and ^M' })

-- Terminal escape
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { noremap = true, desc = 'normal mode' })

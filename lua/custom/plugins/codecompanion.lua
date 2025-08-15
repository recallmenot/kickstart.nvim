return {
  'olimorris/codecompanion.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
  },
  config = function()
    local private = require 'custom.private'
    require('codecompanion').setup {
      adapters = {
        ollama = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = private.get_key 'llm_url', -- optional: default value is ollama url http://127.0.0.1:11434
              api_key = private.get_key 'llm_api_key', -- optional: if your endpoint is authenticated
              chat_url = private.get_key 'llm_completions', -- optional: default value, override if different
            },
          })
        end,
      },
      strategies = {
        chat = {
          adapter = 'ollama',
        },
        inline = {
          adapter = 'ollama',
        },
      },
    }
    vim.keymap.set({ 'n', 'o', 'x' }, '<leader>ccx', '<cmd>CodeCompanionChat Add<cr>', { desc = 'CodeCompanion add' })
    vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cct', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion toggle' })
    vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cca', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion actions' })
  end,
  lazy = false,
}
-- use '#buffer' to access the current buffer

-- plugins/codecompanion.lua
local private_module_exists, private = pcall(require, 'custom.private')

local codecompanion_config = {}

if private_module_exists then
  codecompanion_config = {
    'olimorris/codecompanion.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    config = function()
      require('codecompanion').setup {
        adapters = {
          ollama = function()
            return require('codecompanion.adapters').extend('openai_compatible', {
              env = {
                url = private.get_key 'llm_url',
                api_key = private.get_key 'llm_api_key',
                chat_url = private.get_key 'llm_completions',
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
else
  -- Return an empty plugin table if private.lua doesn't exist
  codecompanion_config = {}
end

return codecompanion_config

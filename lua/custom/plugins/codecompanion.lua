-- plugins/codecompanion.lua
local private_module_exists, private = pcall(require, 'custom.private')

local codecompanion_config = {}

if private_module_exists then
  -- Add dependencies
  vim.pack.add({ "https://github.com/nvim-lua/plenary.nvim" })
  vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

  -- Main plugin
  vim.pack.add({ {
    src = "https://github.com/olimorris/codecompanion.nvim",
    -- version = vim.version.range("^19.0.0"),  -- optional but recommended
  } })

  -- Configuration (runs immediately)
  require('codecompanion').setup {
    adapters = {
      http = {
        -- Use a DIFFERENT name (not "ollama") to avoid triggering the native Ollama adapter
        llama = function()
          return require('codecompanion.adapters').extend('openai_compatible', {
            env = {
              url = private.get_key 'llm_url',           -- e.g. http://127.0.0.1:8080
              api_key = private.get_key 'llm_api_key',   -- often "TERM" or "no-key" for llama.cpp
              chat_url = private.get_key 'llm_completions',  -- usually "/v1/chat/completions"
            },
            -- Optional: force a specific model so it doesn't try to fetch model list
            schema = {
              model = {
                default = private.get_key 'llm_model_name',
              },
            },
          })
        end,
      },
    },

    interactions = {  -- or strategies in older versions
      chat = {
        adapter = "llama",
      },
      inline = {
        adapter = "llama",
      },
    },
  }

  -- Keymaps
  vim.keymap.set({ 'n', 'o', 'x' }, '<leader>ccx', '<cmd>CodeCompanionChat Add<cr>', { desc = 'CodeCompanion add' })
  vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cct', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'CodeCompanion toggle' })
  vim.keymap.set({ 'n', 'o', 'x' }, '<leader>cca', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion actions' })

else
  codecompanion_config = {}
end

return codecompanion_config

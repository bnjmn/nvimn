-- return {
--   'linux-cultist/venv-selector.nvim',
--   dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
--   opts = {
--     -- Your options go here
--     -- name = "venv",
--     -- auto_refresh = false
--   },
--   event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
--   keys = {
--     -- Keymap to open VenvSelector to pick a venv.
--     { '<leader>vs', '<cmd>VenvSelect<cr>' },
--     -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
--     { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
--   },
-- }

return {
  {
    'linux-cultist/venv-selector.nvim',
    dependencies = { 'neovim/nvim-lspconfig', 'nvim-telescope/telescope.nvim', 'mfussenegger/nvim-dap-python' },
    config = function()
     require('venv-selector').setup({
        pipenv_path = '~/.local/share/virtualenvs',
        pyenv_path = '~/.pyenv/versions',
      })
    end,
    opts = {
      -- Your options go here
      -- name = "venv",
      -- auto_refresh = false
    },
    event = 'VeryLazy', -- Optional: needed only if you want to type `:VenvSelect` without a keymapping
    keys = {
      -- Keymap to open VenvSelector to pick a venv.
      { '<leader>vs', '<cmd>VenvSelect<cr>' },
      -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
      { '<leader>vc', '<cmd>VenvSelectCached<cr>' },
    },
  },
}

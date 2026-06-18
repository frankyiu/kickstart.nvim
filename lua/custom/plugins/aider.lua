return {
  'joshuavial/aider.nvim',
  opts = {
    -- your configuration comes here
    -- if you don't want to use the default settings
    auto_manage_context = true, -- automatically manage buffer context
    default_bindings = true,    -- use default <leader>A keybindings
    debug = false,              -- enable debug logging
  },
  key = {
    { '<leader>Ao', ':AiderOpen<CR>',             mode = 'n', desc = 'Open Aider' },
    { '<leader>Am', ':AiderAddModifiedFiles<CR>', mode = 'n', desc = 'Open Aider modified' },
  },
}

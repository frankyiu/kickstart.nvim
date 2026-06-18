return {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = function()
    require('toggleterm').setup {
      direction = 'horizontal',
      dir = '~/Desktop', -- Set working directory
    }
  end,
  keys = {
    -- Normal mode mapping for toggling the terminal.
    { '<leader>t', '<cmd>ToggleTerm<cr>', mode = 'n', desc = 'Toggle terminal' },
    -- Terminal mode mapping for exiting terminal insert mode (essential)
    -- This ensures you can press <Esc> to get back to normal mode within the terminal
    { '<Esc>',     '<C-\\><C-n>',         mode = 't', desc = 'Exit terminal insert mode' },
    -- Example for a specific lazygit terminal (if defined in setup as a custom terminal)
    -- { '<leader>g', '<cmd>ToggleTerm lazygit<cr>', mode = 'n', desc = 'Toggle Lazygit terminal' },
  },
}

return {
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Git diff view' },
      { '<leader>gD', '<cmd>DiffviewOpen master<cr>', desc = 'Git diff against master' },
      { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Git diff close' },
      { '<leader>gh', '<cmd>DiffviewFileHistory %<cr>', desc = 'Git file history' },
    },
  },
}

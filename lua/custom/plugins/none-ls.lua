return {
  'nvimtools/none-ls.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvimtools/none-ls-extras.nvim' },
  config = function()
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    local null_ls = require 'null-ls'
    null_ls.setup {
      sources = {
        null_ls.builtins.formatting.stylua,
        require 'none-ls.formatting.ruff_format',
        require 'none-ls.diagnostics.ruff',
        null_ls.builtins.diagnostics.codespell,
      },
      -- you can reuse a shared lspconfig on_attach callback here
      on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format {
                async = false,
                filter = function(client) return client.name == 'null-ls' end,
              }
            end,
          })
        end
      end,
    }
  end,
  vim.keymap.set('n', '<leader>gf', function()
    vim.lsp.buf.format { async = false, filter = function(client) return client.name == 'null-ls' end }
  end, { buffer = true, desc = 'Format buffer' }),
}

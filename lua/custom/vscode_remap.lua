local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }
-- general keymaps
keymap({ 'n', 'v' }, '<leader>t', "<cmd>lua require('vscode').action('workbench.action.togglePanel')<CR>")
keymap({ 'n', 'v' }, '<leader>b', "<cmd>lua require('vscode').action('editor.debug.action.toggleBreakpoint')<CR>")
keymap({ 'n', 'v' }, '<leader>d', "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({ 'n', 'v' }, '<leader>a', "<cmd>lua require('vscode').action('editor.action.quickFix')<CR>")
keymap({ 'n', 'v' }, '<leader>sp', "<cmd>lua require('vscode').action('workbench.actions.view.problems')<CR>")
keymap({ 'n', 'v' }, '<leader>cn', "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap({ 'n', 'v' }, '<leader>ff', "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap({ 'n', 'v' }, '<leader>fg', "<cmd>lua require('vscode').action('find-it-faster.findWithinFiles')<CR>")
keymap({ 'n', 'v' }, '<leader>cp', "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({ 'n', 'v' }, '<leader>pr', "<cmd>lua require('vscode').action('code-runner.run')<CR>")
keymap({ 'n', 'v' }, '<leader>fd', "<cmd>lua require('vscode').action('editor.action.formatDocument')<CR>")
keymap({ 'n', 'v' }, '<leader>e', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
keymap({ 'n', 'v' }, 'za', "<cmd>lua require('vscode').action('editor.toggleFold')<CR>")

keymap({ 'n', 'x' }, '<C-u>', function()
  local visibleRanges = require('vscode').eval 'return vscode.window.activeTextEditor.visibleRanges'
  local height = visibleRanges[1][2].line - visibleRanges[1][1].line
  for i = 1, height * 2 / 3 do
    vim.api.nvim_feedkeys('k', 'n', false)
  end
  vim.schedule(function()
    require('vscode').action('revealLine', { args = { lineNumber = vim.fn.line '.', at = 'center' } })
  end)
end)
keymap({ 'n', 'x' }, '<C-d>', function()
  local visibleRanges = require('vscode').eval 'return vscode.window.activeTextEditor.visibleRanges'
  local height = visibleRanges[1][2].line - visibleRanges[1][1].line
  for i = 1, height * 2 / 3 do
    vim.api.nvim_feedkeys('j', 'n', false)
  end
  vim.schedule(function()
    require('vscode').action('revealLine', { args = { lineNumber = vim.fn.line '.', at = 'center' } })
  end)
end)
keymap({ 'n', 'x' }, '<C-f>', function()
  local visibleRanges = require('vscode').eval 'return vscode.window.activeTextEditor.visibleRanges'
  local height = visibleRanges[1][2].line - visibleRanges[1][1].line
  for i = 1, height do
    vim.api.nvim_feedkeys('j', 'n', false)
  end
  vim.schedule(function()
    require('vscode').action('revealLine', { args = { lineNumber = vim.fn.line '.', at = 'center' } })
  end)
end)
keymap({ 'n', 'x' }, '<C-b>', function()
  local visibleRanges = require('vscode').eval 'return vscode.window.activeTextEditor.visibleRanges'
  local height = visibleRanges[1][2].line - visibleRanges[1][1].line
  for i = 1, height do
    vim.api.nvim_feedkeys('k', 'n', false)
  end
  vim.schedule(function()
    require('vscode').action('revealLine', { args = { lineNumber = vim.fn.line '.', at = 'center' } })
  end)
end)

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

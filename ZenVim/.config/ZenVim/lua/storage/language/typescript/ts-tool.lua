return {
  'pmizio/typescript-tools.nvim',
  lazy = true,
  keys = {
    {
      mode = 'n',
      'tso',
      '<cmd>TSToolsOrganizeImports<cr>',
      desc = 'ts organize import',
    },
    {
      mode = 'n',
      'tsr',
      '<cmd>TSToolsRemoveUnused<cr>',
      desc = 'ts remove unused statement',
    },
    {
      mode = 'n',
      'tsa',
      '<cmd>TSToolsAddMissingImports<cr>',
      desc = 'ts add missing import',
    },
    {
      mode = 'n',
      'tsx',
      '<cmd>TSToolsFixAll<cr>',
      desc = 'ts fix all',
    },
    {
      mode = 'n',
      'tss',
      '<cmd>TSToolsGoToSourceDefinition<cr>',
      desc = 'ts go to source definition',
    },
    {
      mode = 'n',
      'tsn',
      '<cmd>TSToolsRenameFile<cr>',
      desc = 'ts rename file',
    },
    {
      mode = 'n',
      'tsf',
      '<cmd>TSToolsFileReferences<cr>',
      desc = 'ts find file references',
    },
  },
  ft = { 'javascript', 'javascriptreact', 'json', 'jsonc', 'typescript', 'typescriptreact' },
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
}

-- This plugin provides several custom user commands (they are only applied to current buffer):
--
-- TSToolsOrganizeImports - sorts and removes unused imports
-- TSToolsSortImports - sorts imports
-- TSToolsRemoveUnusedImports - removes unused imports
-- TSToolsRemoveUnused - removes all unused statements
-- TSToolsAddMissingImports - adds imports for all statements that lack one and can be imported
-- TSToolsFixAll - fixes all fixable errors
-- TSToolsGoToSourceDefinition - goes to source definition (available since TS v4.7)
-- TSToolsRenameFile - allow to rename current file and apply changes to connected files
-- TSToolsFileReferences - find files that reference the current file (available since TS v4.2)

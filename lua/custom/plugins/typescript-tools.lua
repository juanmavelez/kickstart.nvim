return {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {
    on_attach = function(client, bufnr)
      client.server_capabilities.documentFormattingProvider = false

      local keymap = vim.keymap.set
      local opts = { buffer = bufnr }

      keymap('n', 'gd', vim.lsp.buf.definition, opts)
      keymap('n', 'gr', vim.lsp.buf.references, opts)
      keymap('n', 'K', vim.lsp.buf.hover, opts)
      keymap('n', '<leader>rn', vim.lsp.buf.rename, opts)
      keymap('n', '<leader>ca', vim.lsp.buf.code_action, opts)
      keymap('n', '<leader>oi', '<cmd>TSToolsOrganizeImports<CR>', opts)
      keymap('n', '<leader>fa', '<cmd>TSToolsFixAll<CR>', opts)
      keymap('n', '<leader>rf', '<cmd>TSToolsRenameFile<CR>', opts)
    end,
    settings = {
      separate_diagnostic_server = true,
      publish_diagnostic_on = 'insert_leave',
      expose_as_code_action = 'all',
      tsserver_plugins = { '@styled/typescript-styled-plugin' }, -- you can add plugins like "@styled/typescript-styled-plugin"
      tsserver_max_memory = 'auto',
      tsserver_format_options = {
        allowIncompleteCompletions = false,
        allowRenameOfImportPath = false,
      },
      tsserver_file_preferences = {
        includeInlayParameterNameHints = 'all',
        includeCompletionsForModuleExports = true,
        quotePreference = 'auto',
      },
    },
  },
}

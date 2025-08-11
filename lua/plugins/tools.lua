return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      { 'mason-org/mason-lspconfig.nvim', opts = {} },
      {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        opts = {
          ensure_installed = {
            -- lsp
            'lua_ls',
            'stylua',
            'ts_ls',
            'gopls',
            'marksman',
            'ruff',
            'taplo',
            'bashls',
            'yamlls',

            -- dap
            'delve',
            'debugpy',
            'js-debug-adapter',

            -- linter
            'shellcheck',
            'eslint',
            'golangci-lint',
            'markdownlint-cli2',

            -- formatter
            'prettierd',
            'gofumpt',
            'goimports',
          },
        },
      },
    },
  },
}

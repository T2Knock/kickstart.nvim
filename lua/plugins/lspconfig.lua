return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} }, -- LSP progress UI
      'saghen/blink.cmp', -- Completion engine
    },
    config = function()
      -- Get enhanced capabilities from blink.cmp for better completion support
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Define LSP servers to install and configure
      local servers = {
        -- Example servers (uncomment and configure as needed):
        -- clangd = {},           -- C/C++
        -- gopls = {},            -- Go
        -- pyright = {},          -- Python
        -- rust_analyzer = {},    -- Rust
        -- ts_ls = {},            -- TypeScript/JavaScript

        -- Lua language server configuration
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Tools to ensure are installed via Mason
      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter
        -- Add other formatters/linters here as needed
      })

      -- Set up mason-tool-installer to automatically install tools
      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      -- Configure mason-lspconfig to set up LSP servers
      require('mason-lspconfig').setup {
        -- Empty table - we handle installation via mason-tool-installer
        ensure_installed = {},
        automatic_installation = false,

        -- Handler function for each LSP server
        handlers = {
          function(server_name)
            local server_config = servers[server_name] or {}

            -- Merge capabilities with any server-specific overrides
            server_config.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server_config.capabilities or {})

            -- Set up the LSP server
            require('lspconfig')[server_name].setup(server_config)
          end,
        },
      }
    end,
  },
}

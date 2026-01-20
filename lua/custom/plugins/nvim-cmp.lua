return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-buffer', -- buffer completions
    'hrsh7th/cmp-path', -- path completions
    'hrsh7th/cmp-nvim-lsp', -- LSP completions
    'L3MON4D3/LuaSnip', -- snippet engine
    'saadparwaiz1/cmp_luasnip', -- snippet completions
    'hrsh7th/cmp-cmdline', -- cmdline completions
  },
  config = function()
    -- Configuration code will go here
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'

    cmp.setup {
      -- You must specify a snippet engine
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For luasnip users
        end,
      },
      completion = {
        completeopt = 'menu,menuone,noinsert',
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(), -- manually trigger completion
        ['<C-e>'] = cmp.mapping.abort(), -- close completion menu
        ['<CR>'] = cmp.mapping.confirm { select = true }, -- confirm selection
      },
      sources = cmp.config.sources {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
        { name = 'path' },
      },
    }

    -- Setup LSP capabilities to use nvim-cmp
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Example with a specific LSP server (you would put this in your lspconfig setup)
    -- require('lspconfig').lua_ls.setup({
    --   capabilities = capabilities,
    -- })
  end,
}

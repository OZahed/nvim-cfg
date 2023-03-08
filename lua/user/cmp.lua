local cmp = require'cmp'

require('snippy').setup({
    mappings = {
        is = {
            ['<Tab>'] = 'expand_or_advance',
            ['<S-Tab>'] = 'previous',
        },
        nx = {
            ['<leader>x'] = 'cut_text',
        },
    },
})


cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-d>"] = cmp .mapping. scroll_docs (-4),
        ['<C-f>'] = cmp. mapping. scroll_docs(4),
        ['<C-o>'] = cmp. mapping. complete( ),
        ['<C-e>'] = cmp. mapping. close() ,
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' }, -- For vsnip users.
        -- { name = 'luasnip' }, -- For luasnip users.
        -- { name = 'ultisnips' }, -- For ultisnips users.
        -- { name = 'snippy' }, -- For snippy users.
    }, {
            { name = 'buffer' },
        })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
    sources = {
        {name = 'nvim_lsp'},
        {name = 'look'},
        {name= "buffer"},
    } 
})

local lsp = require 'lspconfig'
local cmp_lsp = require 'cmp_nvim_lsp'

lsp.vimls.setup {
    capabilities = cmp_lsp.default_capabilities(),
    
    require('lspconfig')['pyright'].setup {
        capabilities = capabilities
    },
    require('lspconfig')['gopls'].setup {
        capabilities = capabilities
    },
    require('lspconfig')['clangd'].setup {
        capabilities = capabilities
    },
}


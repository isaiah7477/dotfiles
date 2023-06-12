require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = { "lua_ls", "jedi_language_server" }
})

local on_attach = function(_, bufnr)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
	vim.keymap.set('n', 'gi', vim.lsp.buf.implnmentation, {})
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").jedi_language_server.setup {
	on_attatch = on_attach,
	capabilities = capabilities,
}

require("lspconfig").lua_ls.setup {
	on_attatch = on_attach,
	capabilities = capabilities,
}


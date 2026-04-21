-- Reserve a space in the gutter to avoid layout shift
vim.opt.signcolumn = 'yes'

-- Buffer-local LSP keymaps. Navigation keymaps (gd, gD, gi, gr, gy) are
-- intentionally omitted here — snacks.picker provides fuzzy-find versions
-- in lua/plugins/snacks.lua. Format is on <leader>F (capital) so it doesn't
-- shadow the <leader>f* snacks file-picker group.
vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gs', vim.lsp.buf.signature_help, opts)
		vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
		vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
		vim.keymap.set({ 'n', 'x' }, '<leader>F', function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		"awk_ls",
		"bashls",
		"lua_ls",
		"nextls",
		"pyright",
		"ruff",
		"rust_analyzer",
		"vale_ls",
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
		["lua_ls"] = function()
			require("lspconfig").lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
					},
				},
			})
		end,
		["nextls"] = function()
			require("lspconfig").nextls.setup({
				cmd = { "nextls", "--stdio" },
				init_options = {
					extensions = { credo = { enable = true } },
					experimental = { completions = { enable = true } },
				},
			})
		end,
	},
})

-- Format on save (normal mode, modified, non-oil buffers)
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		if vim.bo.modified
			and vim.api.nvim_get_mode().mode == 'n'
			and vim.bo.filetype ~= "oil"
		then
			vim.lsp.buf.format()
		end
	end,
})

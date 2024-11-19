local cmp = require('cmp')

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
	formatting = {
		fields = { 'abbr', 'kind', 'menu' },
		format = require('lspkind').cmp_format({
			mode = 'symbol', -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead
			symbol_map = {
				Copilot = "",
			},
		})
	},

	mapping = cmp.mapping.preset.insert({
		['<CR>'] = cmp.mapping.confirm({ select = false }),
		-- Super tab
		['<Tab>'] = cmp.mapping(function(fallback)
			local luasnip = require('luasnip')
			local col = vim.fn.col('.') - 1

			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = 'select' })
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),

		-- Super shift tab
		['<S-Tab>'] = cmp.mapping(function(fallback)
			local luasnip = require('luasnip')

			if cmp.visible() and has_words_before() then
				cmp.select_prev_item({ behavior = 'select' })
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
	sorting = {
		priority_weight = 2,
		comparators = {
			require("copilot_cmp.comparators").prioritize,

			-- Below is the default comparitor list and order for nvim-cmp
			cmp.config.compare.offset,
			-- cmp.config.compare.scopes, --this is commented in nvim-cmp too
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.recently_used,
			cmp.config.compare.locality,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
	sources = {
		{ name = 'copilot' },
		{ name = 'nvim_lsp' },
		{ name = 'path' },
		{ name = 'cmdline' },
		{ name = 'buffer' },
	},
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body)
		end,
	},
})

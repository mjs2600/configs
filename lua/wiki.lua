vim.g.vimwiki_list = {{path='~/knowledge-graph',
                       syntax='markdown',
                       ext='.md',
                       diary_rel_path='log/'}}

vim.g.vimwiki_global_ext = 0

vim.api.nvim_exec([[
  autocmd FileType vimwiki :nmap <Leader>tt <Plug>VimwikiToggleListItem
  autocmd FileType vimwiki :vmap <Leader>tt <Plug>VimwikiToggleListItem
  autocmd FileType vimwiki silent! :lcd ~/Dropbox/knowledge-graph/
]], false)

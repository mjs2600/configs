(set vim.g.vimwiki_list [{"path" "~/knowledge-graph"
                           "syntax" "markdown"
                           "ext" ".md"
                           "diary_rel_path" "log/"}])

(set vim.g.vimwiki_global_ext 0)

(set vim.g.tiddlywiki_author "Michael")
(set vim.g.tiddlywiki_dir "~/Dropbox/wiki")
(set vim.g.tiddlywiki_autoupdate 1)

(vim.api.nvim_exec
  "
  autocmd FileType vimwiki :nmap <Leader>tt <Plug>VimwikiToggleListItem
  autocmd FileType vimwiki silent! :lcd ~/knowledge-graph/
  "
  false)

-- Only non-default options are set; see `:help oil-config` for the rest.
require("oil").setup({
  default_file_explorer = true,
  columns = { "icon" },
  delete_to_trash = true,
  view_options = {
    show_hidden = false,
  },
})

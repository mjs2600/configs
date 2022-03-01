local parser_config = require "nvim-treesitter.parsers".get_parser_configs()

require('orgmode').setup_ts_grammar()

require('nvim-treesitter.configs').setup {
  ensure_installed = {'org', 'rust', 'python', 'json', 'julia', 'fish', 'yaml', 'bash', 'vim', 'lua', 'graphql', 'html', 'dockerfile', 'comment', 'hcl', 'toml', 'tsx', 'turtle', 'sparql'}, -- Or run :TSUpdate org
}

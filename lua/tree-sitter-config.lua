require "nvim-treesitter.parsers".get_parser_configs()

require('nvim-treesitter.configs').setup {
  ensure_installed = {'rust', 'python', 'json', 'julia', 'fish', 'yaml', 'bash', 'vim', 'lua', 'graphql', 'html', 'dockerfile', 'comment', 'hcl', 'toml', 'tsx', 'turtle', 'sparql'},
}

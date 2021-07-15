vim.g.tagbar_type_elixir = {
     ctagstype = 'elixir',
     kinds = {
        'm:modules',
        'f:functions',
        'functions:functions',
        'c:callbacks',
        'd:delegates',
        'e:exceptions',
        'i:implementations',
        'a:macros',
        'o:operators',
        'p:protocols',
        'r:records',
        't:tests'
   }
}

vim.g.tagbar_type_rust = {
     ctagstype = 'rust',
     kinds = {
        'T:types',
        'f:functions',
        'g:enums',
        's:structure names',
        'm:modules,module names',
        'c:consts',
        't:traits',
        'i:impls',
  }
}

vim.g.tagbar_type_haskell = {
     ctagsbin = 'hasktags',
    ctagsargs = '-x -c -o-',
    kinds = {
        'm:modules:0:1',
        'd:data: 0:1',
        'd_gadt: data gadt:0:1',
        't:type names:0:1',
        'nt:new types:0:1',
        'c:classes:0:1',
        'cons:constructors:1:1',
        'c_gadt:constructor gadt:1:1',
        'c_a:constructor accessors:1:1',
        'ft:function types:1:1',
        'fi:function implementations:0:1',
        'o:others:0:1'
    },
    sro = '.',
    kind2scope = {
        m = 'module',
        c = 'class',
        d = 'data',
        t = 'type'
    },
    scope2kind = {
        module = 'm',
        class  = 'c',
        data   = 'd',
        type   = 't'
    }
}

vim.g.tagbar_type_markdown = {
    ctagstype = 'markdown',
    kinds = {
      'h:Heading_L1',
      'i:Heading_L2',
      'k:Heading_L3'
    }
}

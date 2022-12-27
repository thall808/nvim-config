local null_ls = require "null-ls"

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.diagnostics.cfn_lint,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    },
})

vim.api.nvim_create_autocmd({'BufNewFile', 'BufRead'} , {
    pattern = 'deployment.yaml',
    callback = function()
          vim.opt_local.filetype = 'helm'
    end})

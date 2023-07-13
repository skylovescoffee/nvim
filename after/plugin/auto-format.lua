-- https://github.com/vim-autoformat/vim-autoformat/blob/master/plugin/defaults.vim


-- HTML formatters
vim.g["formatdef_htmlbeautify"] = "'html-beautify -f -'"
vim.g["formatters_html"] = {"htmlbeautify"}

-- CSS formatters
-- Just using defaults for this one

vim.cmd([[augroup fmt
  autocmd!
  autocmd BufWritePre *.{html,css,json} Autoformat
augroup END]])




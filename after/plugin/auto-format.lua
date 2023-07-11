vim.g["formatdef_htmlbeautify"] = "'html-beautify -f -'"
vim.g["formatters_html"] = {"htmlbeautify"}

vim.cmd([[augroup fmt
  autocmd!
  autocmd BufWritePre *.html Autoformat
augroup END]])




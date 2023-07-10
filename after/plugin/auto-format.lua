vim.g["formatdef_tidy"] = "'tidy -q -i'"
vim.g["formatters_html"] = {"tidy"}

vim.cmd([[augroup fmt
  autocmd!
  autocmd BufWritePre *.html Autoformat
augroup END]])




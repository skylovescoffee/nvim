
vim.g.ale_linters = {
    javascript = {'prettier', 'eslint'},
    typescript = {'prettier', 'eslint'},
    javascriptreact = {'prettier', 'eslint'},
    typescriptreact = {'prettier', 'eslint'},
    rust = { 'analyzer' }
}

vim.g.ale_fixers = {
    javascript = {'prettier', 'eslint'},
    typescript = {'prettier', 'eslint'},
    javascriptreact = {'prettier', 'eslint'},
    typescriptreact = {'prettier', 'eslint'},
}

vim.g.ale_fix_on_save = 1


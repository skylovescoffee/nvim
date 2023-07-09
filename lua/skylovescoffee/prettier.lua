local M = {}

function M.set_tab_width_from_prettier()
  local handle = io.popen("cat .prettierrc | jq '.tabWidth'")
  local result = handle:read("*a")
  print('result', tab_width)
  handle:close()

  local tab_width = tonumber(result)
  print('inside the set tab fun zone', tab_width)
  if tab_width then
    vim.opt.tabstop = tab_width
    vim.opt.shiftwidth = tab_width
  end
end

return M



local M = {}

function M.remap(mode, rhs, lhs, bufopts, desc)
  if bufopts == nil then
    bufopts = {}
  end
  bufopts.desc = desc
  vim.keymap.set(mode, rhs, lhs, bufopts)
end

function M.map(mode, rhs, lhs, bufopts, desc)
  if bufopts == nil then
    bufopts = {}
  end
  bufopts.desc = desc
  vim.keymap.set(mode, rhs, lhs, bufopts)
end

return M

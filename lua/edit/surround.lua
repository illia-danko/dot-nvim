local M = {}

M.config = function()
  local ok, nvim_surround = pcall(require, "nvim-surround")
  if not ok then
    return
  end
  nvim_surround.setup({})
end

return M

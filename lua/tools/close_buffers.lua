local M = {}

M.config = function()
  local ok, close_buffers = pcall(require, "close_buffers")
  if not ok then
    return
  end

  local ok, project = pcall(require, "project_nvim.project")
  if not ok then
    return
  end

  vim.keymap.set(
    "n",
    "<localleader>db",
    "<cmd>bp | sp | bn | bd<cr>",
    { desc = "close_buffer_no_window" }
  )

  vim.keymap.set("n", "<localleader>dd", function()
    local file_name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), "%")
    close_buffers.wipe({ type = "this", force = true })
    print("Close " .. file_name)
  end, { desc = "close_current_buffer" })

  vim.keymap.set("n", "<localleader>do", function()
    close_buffers.wipe({ type = "other", force = true })
    print("Close other buffers")
  end, { desc = "close_other_buffers" })

  vim.keymap.set("n", "<localleader>d#", function()
    close_buffers.wipe({ type = "all", force = true })
    print("Close all buffers")
  end, { desc = "close_all_buffers" })

  vim.keymap.set("n", "<localleader>dp", function()
    local project_root = project.get_project_root()
    close_buffers.wipe({ regex = project_root, force = true })
    print(string.format("Close <%s> buffers", vim.fn.fnamemodify(project_root, ":t")))
  end, { desc = "close_project_buffers " })
end

return M

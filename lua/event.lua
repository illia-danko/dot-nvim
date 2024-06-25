local gr = vim.api.nvim_create_augroup("GenericEventGroup", {})

local M = {}

M.init = function()
  vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = gr,
    pattern = { "COMMIT_EDITMSG" },
    callback = function()
      vim.opt_local.spell = true
    end,
  })

  vim.api.nvim_create_autocmd({ "FileType" }, {
    group = gr,
    pattern = { "help" },
    callback = function()
      pcall(vim.cmd, "only")
    end,
  })

  vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
    group = gr,
    pattern = { "*" },
    callback = function()
      require("utils.cursor").restore_buffer_pos()
      require("utils.cursor").toggle_fold_section()
    end,
  })

  vim.api.nvim_create_autocmd({ "VimResized" }, {
    group = gr,
    pattern = { "*" },
    callback = function()
      vim.cmd("tabdo wincmd =")
    end,
  })
end

return M

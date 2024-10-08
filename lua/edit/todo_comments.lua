local M = {}

M.config = function()
  require("todo-comments").setup({
    signs = false,
    highlight = {
      keyword = "fg",
      after = "",
      pattern = [[.*<(KEYWORDS)\s*(\(.*\))?\s*:?]],
      comments_only = false,
    },
    keywords = {
      TODO = { icon = "󱦟 ", color = "hint" },
      DONE = { icon = " ", color = "info" },
    },
  })
end

return M

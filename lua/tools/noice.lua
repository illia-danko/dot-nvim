local M = {}

M.config = function()
  local ok, noice = pcall(require, "noice")
  if not ok then
    return
  end

  noice.setup({
    lsp = {
      -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    -- you can enable a preset for easier configuration
    presets = {
      bottom_search = true, -- use a classic bottom cmdline for search
      long_message_to_split = true, -- long messages will be sent to a split
      inc_rename = false, -- enables an input dialog for inc-rename.nvim
      lsp_doc_border = false, -- add a border to hover docs and signature help
    },
    -- Avoid write file (:w) messages.
    routes = {
      {
        filter = {
          event = "msg_show",
          kind = "",
          find = "written",
        },
        opts = { skip = true },
      },
    },
  })
end

M.opts = function(_, opts)
  -- opts.routes = {
  --   { -- filter write messages "xxxL, xxxB"
  --     filter = {
  --       event = "msg_show",
  --       find = "%dL",
  --     },
  --     opts = { skip = true },
  --   },
  -- }
end

return M

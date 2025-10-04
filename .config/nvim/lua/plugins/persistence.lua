return {
  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"),
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
    init = function()
      -- Auto-restore session
      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("restore_session", { clear = true }),
        callback = function()
          -- Only load the session if nvim was started with no args
          if vim.fn.argc(-1) == 0 then
            require("persistence").load()
          end
        end,
        nested = true,
      })
    end,

    -- keys = {
    --   {
    --     "<leader>qs",
    --     function()
    --       require("persistence").load()
    --     end,
    --     desc = "Restore Session",
    --   },
    --   {
    --     "<leader>ql",
    --     function()
    --       require("persistence").load({ last = true })
    --     end,
    --     desc = "Restore Last Session",
    --   },
    --   {
    --     "<leader>qd",
    --     function()
    --       require("persistence").stop()
    --     end,
    --     desc = "Don't Save Current Session",
    --   },
    -- },
  },
}

return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>sO",
        function()
          local function search_other_dir()
            local cwd = vim.fn.getcwd()
            local new_dir = vim.fn.input("Enter directory to search: ", "/home/paquinteroc", "dir")
            if new_dir ~= "" then
              require("telescope.builtin").live_grep({
                cwd = new_dir,
                prompt_title = "Live Grep in " .. new_dir,
              })
            end
          end
          search_other_dir()
        end,
        desc = "Search in other directory",
      },
    },
    opts = {
      defaults = {
        -- other defaults...
      },
      pickers = {
        live_grep = {
          additional_args = function(opts)
            return { "--hidden" }
          end,
        },
      },
    },
  },
}

return {
  -- Your other plugins...

  {
    "nvim-lua/plenary.nvim",
    config = function()
      local function setup_python_dev()
        -- Open a vertical split
        vim.cmd("vsplit")

        -- Move to the right window
        vim.cmd("wincmd l")

        -- Open a terminal in the right window
        vim.cmd("terminal")

        -- Switch to normal mode in terminal
        vim.cmd("stopinsert")

        -- Move back to the left window
        vim.cmd("wincmd h")

        -- Open a Python file (adjust the path as needed)
        vim.cmd("edit " .. vim.fn.input("Enter Python file path: "))
      end

      -- Create a command to easily trigger this setup
      vim.api.nvim_create_user_command("PythonDevSetup", setup_python_dev, {})

      -- Optional: Set up a keybinding to trigger the setup
      vim.keymap.set("n", "<leader>ps", ":PythonDevSetup<CR>", { noremap = true, silent = true })
    end,
  },

  -- More of your plugins...
}

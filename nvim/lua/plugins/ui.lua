return {
   {
      "mhinz/vim-startify",
   },
   {
      "scottmckendry/cyberdream.nvim",
      lazy = false,
      priority = 1000,
      init = function()
         require("cyberdream").setup({
            transparent=true
         })
         vim.cmd.colorscheme("cyberdream")
      end
   },
   {
      "aznhe21/actions-preview.nvim",
      config = function()
         vim.keymap.set(
            { "v", "n" },
            "<Leader>ca",
            require("actions-preview").code_actions
         )
      end,
   },
}

return {
   {
      "m4xshen/autoclose.nvim",
      opts = {
         options = {
            disabled_filetypes = { "text" },
            disable_when_touch = true,
            pair_spaces = true,
         },
         keys = {
            ["'"] = {
               escape = true,
               close = true,
               pair = "''",
               disabled_filetypes = { "markdown" },
            },
            ["`"] = { escape = false, close = true, pair = "``" },
         },
      },
   },
   "windwp/nvim-ts-autotag",
   {
      "kylechui/nvim-surround",
      version = "*",
      event = "VeryLazy",
      opts = {
         keymaps = {
            normal = "gs",
            normal_cur = "gss",
         },
      },
   },
   {
     "kylechui/nvim-surround",
     version = "^4.0.0",
     event = "VeryLazy",

     init = function()
       vim.g.nvim_surround_no_normal_mappings = true
     end,

     config = function()
       require("nvim-surround").setup({})

       vim.keymap.set(
         "n",
         "gs",
         "<Plug>(nvim-surround-normal)",
         { desc = "Add surround" }
       )

       vim.keymap.set(
         "n",
         "gss",
         "<Plug>(nvim-surround-normal-cur)",
         { desc = "Surround line" }
       )

       vim.keymap.set("v", "gs", "<Plug>(nvim-surround-visual)")
       vim.keymap.set("v", "gS", "<Plug>(nvim-surround-visual-line)")
     end,
   },
}

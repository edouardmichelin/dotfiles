return {
   {
      "lukas-reineke/virt-column.nvim",
      opts = {},
   },
   {
      "m4xshen/smartcolumn.nvim",
      opts = {
         disabled_filetypes = {
            "netrw",
            "NvimTree",
            "Lazy",
            "mason",
            "help",
            "text",
            "markdown",
            "tex",
            "html",
         },
         scope = "window",
      },
   },
   {
      "nvim-lualine/lualine.nvim",
      dependencies = { "nvim-tree/nvim-web-devicons" },
      opts = {
         options = {
            theme = "catppuccin",
            globalstatus = true,
         },
         sections = {
            lualine_c = {},
         },
      },
      init = function()
         vim.opt.showmode = false
      end,
   },
   {
      "nvim-tree/nvim-tree.lua",
      opts = { on_attach = on_attach_change },
      keys = {
         { "<Leader>tt", ":NvimTreeToggle<CR>" },
         { "<Leader>tf", ":NvimTreeFocus<CR>" },
      },
   },
   {
      "akinsho/bufferline.nvim",
      version = "v4.*",
      dependencies = "nvim-tree/nvim-web-devicons",
      opts = {
         options = {
            separator_style = "slant",
            mode = "buffers",
            offsets = {
               {
                  filetype = "NvimTree",
                  text = " File Explorer",
                  highlight = "Directory",
                  separator = false,
               },
            },
         },
      },
   },
   {
      "utilyre/barbecue.nvim",
      name = "barbecue",
      version = "*",
      theme = "catppuccin",
      dependencies = {
         "SmiteshP/nvim-navic",
         "nvim-tree/nvim-web-devicons",
      },
      opts = {
         show_dirname = false,
         show_basename = false,
      },
   },
}

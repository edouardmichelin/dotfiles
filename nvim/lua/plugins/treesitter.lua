return {
   {
      "nvim-treesitter/nvim-treesitter",
      lazy="false",
      branch="main",
      build = ":TSUpdate",
      config = function()
         require("nvim-treesitter").setup({
            highlight = { enable = true },
            indent = { enable = true },
            autotag = { enable = true },
         })
         require("nvim-treesitter").install({
            "astro",
            "asm",
            "c",
            "cpp",
            "css",
            "comment",
            "devicetree",
            "dockerfile",
            "html",

            "latex",
            "lua",
            "markdown",
            "make",
            "objdump",
            "php_only",
            "python",
            "tsx",
            "vim",
            "vimdoc"
         })
         vim.filetype.add({
            extension = {
               S = "asm"
            }
         })
      end,
   },
   {
      "nvim-treesitter/nvim-treesitter-textobjects",
      branch="main",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      config = function()
         require("nvim-treesitter-textobjects").setup({
            select = {
               enable = true,
               lookahead = true,
               keymaps = {
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = "@class.inner",
               },
            },
         })
      end,
   },
}

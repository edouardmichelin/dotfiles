return {
   {
      "iamcco/markdown-preview.nvim",
      build = function()
         vim.fn["mkdp#util#install"]()
      end,
      config = function()
         vim.cmd([[
         let g:mkdp_browser = '/usr/bin/firefox'
         ]])
      end,
   },
}

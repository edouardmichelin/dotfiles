vim.keymap.set(
   "n",
   "<Leader>e",
   vim.diagnostic.open_float,
   { noremap = true, silent = true }
)
vim.keymap.set(
   "n",
   "<Leader>a",
   vim.lsp.buf.code_action,
   { noremap = true, silent = true }
)

vim.keymap.set("n", "<space>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
   group = vim.api.nvim_create_augroup("UserLspConfig", {}),
   callback = function(ev)
      vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

      local opts = { buffer = ev.buf }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
      vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
      -- vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
      vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
   end,
})

local languages = {
   "asm_lsp",
   "clangd",
   "html",
   "cssls",
   "dockerls",
   "tailwindcss",
   "ts_ls",
   "emmet_ls",
   "eslint",
   "pyright",
   "gopls",
   "ltex",
   "zk",
   "intelephense",
   "rust_analyzer",
   "sqls",
   "lua_ls"
}

return {
   {
      "neovim/nvim-lspconfig",
      dependencies = { "hrsh7th/cmp-nvim-lsp" },
      config = function()
         local capabilities = require("cmp_nvim_lsp").default_capabilities()

         vim.lsp.config("lua_ls", {
            capabilities = capabilities,
            settings = {
               Lua = {
                  diagnostics = {
                     globals = { "vim", "describe", "it" },
                  },
               },
            },
         })

         vim.lsp.config("tailwindcss", {
            on_attach = function()
               require("tailwindcss-colors").buf_attach(0)
            end,
         })

         vim.lsp.config("asm_lsp", {
            capabilities = capabilities,
            cmd = { "asm-lsp" },
            filetypes = { "S", "asm" },
            root_markers = { ".asm-lsp.toml", ".git" }
         })

         for _, language in pairs(languages) do
            vim.lsp.enable(language)
         end

         vim.keymap.set(
            "n",
            "<Leader>fa",
            ":EslintFixAll<CR>",
            { noremap = true, silent = true }
         )

         vim.lsp.handlers["textDocument/publishDiagnostics"] =
            vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
               virtual_text = false,
            })
      end,
   },
   {
      "williamboman/mason.nvim",
      opts = {},
   },
   {
      "williamboman/mason-lspconfig.nvim",
      opts = {
         ensure_installed = {
            "asm_lsp",
            "clangd",
            "html",
            "cssls",
            "dockerls",
            "tailwindcss",
            "ts_ls",
            "emmet_ls",
            "eslint",
            "pyright",
            "gopls",
            "ltex",
            "zk",
            "intelephense",
            "rust_analyzer",
            "sqls",
            "lua_ls",
         },
      },
   },
}


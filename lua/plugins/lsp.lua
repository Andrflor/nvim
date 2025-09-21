-- ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
-- ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
-- ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
-- ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
-- ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
-- ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
--
-- File: plugins/lsp.lua
-- Description: LSP setup and config
-- Author: Florian Andrieu <andrieu.florian@mail.com>

local servers = {
  "dockerls", "bashls", "gopls", "pyright", "jsonls",
  "vimls", "yamlls", "clangd", "lua_ls", "rust_analyzer",
  "ts_ls", "ols", "glslls"
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = servers,
  automatic_installation = true,
})

-- Capabilities (nvim-cmp)
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Diagnostic signs
local signs = { Error = " ", Warn = " ", Info = " ", Hint = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
vim.diagnostic.config({
  virtual_text = { prefix = "●" },
})

local use_new_api = vim.fn.has("nvim-0.11") == 1

for _, lsp in ipairs(servers) do
  if use_new_api then
    vim.lsp.config(lsp, { capabilities = capabilities })
    vim.lsp.enable(lsp)
  else
    require("lspconfig")[lsp].setup({ capabilities = capabilities })
  end
end

-- luasnip
local luasnip = require("luasnip")

-- lspkind
local lspkind = require("lspkind")

-- nvim-cmp
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = "symbol",
      maxwidth = 50,
      ellipsis_char = "...",
      before = function(entry, vim_item)
        vim_item.menu = ({
          nvim_lsp = "[LSP]",
          luasnip = "[SNIP]",
          buffer = "[BUF]",
          path = "[PAT]",
        })[entry.source.name]
        return vim_item
      end,
    }),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  }),
  sources = {
    { name = "copilot" },
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "path" },
    {
      name = "buffer",
      option = {
        get_bufnrs = function()
          local buf = vim.api.nvim_get_current_buf()
          local byte_size = vim.api.nvim_buf_get_offset(buf, vim.api.nvim_buf_line_count(buf))
          if byte_size > 1024 * 1024 then return {} end
          return { buf }
        end,
      },
    },
  },
})

-- indent-blankline avec rainbow
require("ibl").setup({})
local highlight = {
  "RainbowRed", "RainbowYellow", "RainbowBlue",
  "RainbowOrange", "RainbowGreen", "RainbowViolet", "RainbowCyan",
}
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

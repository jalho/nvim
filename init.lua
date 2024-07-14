vim.o.clipboard = "unnamedplus" -- Use system clipboard.
vim.wo.relativenumber = true    -- AKA ":set relativenumber"
vim.wo.wrap = false             -- AKA ":set nowrap"

vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
vim.o.foldenable = true -- Start folded. Toggling: <z><M>, <z><R>

-- [[
--     Hotkey: Explore filesystem.
-- ]]
vim.api.nvim_set_keymap('n', '<C-e>',
  -- a "traditional" Vim command; no "<cmd>" prefix needed
  ':Explore<CR>',
  { noremap = true, silent = true })

-- [[
--     Hotkey: Open a floating diagnostic window.
-- ]]
vim.api.nvim_set_keymap('n', '<C-Space>',
  -- a "Lua function"; needs "<cmd>" prefix
  '<cmd>lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true })


-- [[
--     Language server for _Zig_ programming language.
--
--     Accessed 2024-07-10: https://github.com/zigtools/zls
--
--     To verify all's good, do ':checkhealth lsp' while having a 'zig' file
--     open. It should show the 'zls' being active.
--
--     As of 2024-07-10, one of the features enabled by default by Neovim's
--     LSP client is triggering code completion in INSERT mode by <C-X><C-O>.
-- ]]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'zig',
  callback = function(args)
    vim.lsp.start({
      name = 'zls',
      cmd = {'zls'},
    })
  end,
})

-- [[
--     Language server for _Rust_ programming language.
--
--     Accessed 2024-07-14: https://github.com/rust-lang/rust-analyzer/releases/2024-07-08
--     --> "rust-analyzer-x86_64-unknown-linux-gnu.gz"
-- ]]
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'rust', -- not really a "pattern"; somehow maps to "*.rs" files
  callback = function(args)
    vim.lsp.start({
      name = 'rust-analyzer',
      cmd = {'rust-analyzer'},
    })
  end,
})

-- [
--    Interface for Tree-sitter.
--
--    Accessed 2024-07-14: https://github.com/nvim-treesitter/nvim-treesitter
-- ]
vim.o.runtimepath = vim.o.runtimepath .. ',~/.config/nvim/pack/start/nvim-treesitter'
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}


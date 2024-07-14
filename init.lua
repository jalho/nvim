-- [[
-- 	Explore filesystem by `<Space>e`.
-- ]]
_G.explore = function()
    vim.cmd('Explore')
end
vim.api.nvim_set_keymap(
	'n', '<Space>e', '<cmd>lua explore()<CR>',
	{ noremap = true, silent = true })


-- [[
--	Use system clipboard.
-- ]]
vim.o.clipboard = "unnamedplus"


-- [[
--	AKA ":set relativenumber"
-- ]]
vim.wo.relativenumber = true


-- [[
-- 	Language server for _Zig_ programming language.
--
--	Accessed 2024-07-10: https://github.com/zigtools/zls
--
--	To verify all's good, do ':checkhealth lsp' while having a 'zig' file
--	open. It should show the 'zls' being active.
--
--	As of 2024-07-10, one of the features enabled by default by Neovim's
--	LSP client is triggering code completion in INSERT mode by <C-X><C-O>.
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
-- 	Language server for _Rust_ programming language.
--
--	Accessed 2024-07-14: https://github.com/rust-lang/rust-analyzer/releases/2024-07-08
--	--> "rust-analyzer-x86_64-unknown-linux-gnu.gz"
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


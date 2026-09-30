local base_on_attach = vim.lsp.config.eslint.on_attach

local group = vim.api.nvim_create_augroup("eslint_fix_all", {
  clear = false
})

vim.lsp.config("eslint", {
  on_attach = function(client, bufnr)
    if base_on_attach then
      base_on_attach(client, bufnr)
    end

    vim.api.nvim_clear_autocmds({
      group = group,
      buffer = bufnr
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      buffer = bufnr,
      command = "LspEslintFixAll"
    })
  end
})

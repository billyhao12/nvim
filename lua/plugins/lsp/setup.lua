return {
  tsserver = function(_, opts)
    require("lazyvim.util").on_attach(function(client, buffer)
      if client.name == "tsserver" then
          -- stylua: ignore
          vim.keymap.set("n", "<leader>co", "<cmd>TypescriptOrganizeImports<CR>", { buffer = buffer, desc = "Organize Imports" })
          -- stylua: ignore
          vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { desc = "Rename File", buffer = buffer })
      end
    end)
    require("typescript").setup({ server = opts })
    return true
  end,
  eslint = function()
    vim.api.nvim_create_autocmd("BufWritePre", {
      callback = function(event)
        local client = vim.lsp.get_active_clients({ bufnr = event.buf, name = "eslint" })[1]
        if client then
          local diag = vim.diagnostic.get(event.buf, { namespace = vim.lsp.diagnostic.get_namespace(client.id) })
          if #diag > 0 then
            vim.cmd("EslintFixAll")
          end
        end
      end,
    })
  end,
}

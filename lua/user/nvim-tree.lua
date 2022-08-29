require("nvim-tree").setup{

  auto_reload_on_write = true,
  view = {
    width = 28
  },
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "🡢",
          arrow_open = "🡣"
        }
      }
    }
  },
  open_on_tab = true,
  actions = {
    open_file = {
    quit_on_open = true,
    }
  }
}

vim.api.nvim_create_autocmd('BufEnter', {
    command = "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif",
    nested = true,
})



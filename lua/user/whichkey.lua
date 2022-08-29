local wk = require("which-key")
wk.setup {
  plugins = {
    marks = false,
    registers = false,
    spelling = { enabled = false, suggestions = 20 },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = false,
      nav = false,
      z = false,
      g = false
    }
  }
}

local mappings = {
  q = { ":q<cr>", "Quit" },
  b = { ":NvimTreeToggle<cr>", "Toggle NvimTree" },
  c = { ":bd<cr>", "Close current buffer" },
  f = { ":Telescope find_files<cr>", "Find files" },
  r = { ":Telescope live_grep<cr>", "Live Grep" },
  l = {
    name = "LSP",
    i = { ":LspInfo<cr>", "List connected LSP" },
    c = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>', "Add New Folder" },
    m = { 'lua vim.lsp.buf.remove_workspace_folder()<cr>', "Remove Folder" },
    l = {
      '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>',
      "List Folder"
    },
    t = { '<cmd>lua vim.lsp.buf.type_definition()<cr>', "Type Definition" },
    d = { '<cmd>lua vim.lsp.buf.definition()<cr>', "Go To Definition" },
    D = { '<cmd>lua vim.lsp.buf.declaration()<cr>', "Go To Declaration" },
    r = { '<cmd>lua vim.lsp.buf.references()<cr>', "References" }
  },
  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
}

local opts = { prefix = '<leader>' }
wk.register(mappings, opts)

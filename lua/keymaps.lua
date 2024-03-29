local fzf = require("fzf-lua")
local wk = require("which-key")
local dap = require("dap")
local dap_ui = require("dap.ui.widgets")
local opts = { noremap = true, silent = true }

-- Move around windows easier
vim.keymap.set("n", "<C-h>", "<C-w>h", opts)
vim.keymap.set("n", "<C-j>", "<C-w>j", opts)
vim.keymap.set("n", "<C-k>", "<C-w>k", opts)
vim.keymap.set("n", "<C-l>", "<C-w>l", opts)
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", opts)

wk.register({
  f = {
    name = "Find Things",
    f = { fzf.files, "Find Files" },
    q = { fzf.quickfix, "Quickfix List" },
    g = { fzf.live_grep_native, "Live Grep" },
    s = { fzf.lsp_document_symbols, "Find Document Symbols" },
    S = { fzf.lsp_workspace_symbols, "Find Workspace Symbols" },
    b = { fzf.buffers, "Pick Buffer" },
    h = { fzf.help_tags, "Find Help" },
  },
  t = {
    name = "Trouble",
    t = { "<cmd>TroubleToggle<CR>", "Toggle Trouble" },
    q = { "<cmd>TroubleToggle quickfix<cr>", "Toggle Quickfix" },
    d = { "<cmd>TroubleToggle document_diagnostics<cr>", "Open Document Diagnostics" },
  },
  k = { vim.lsp.buf.signature_help, "Signature Help" },
  r = { vim.lsp.buf.rename, "Rename Variable" },
  e = { "<cmd>Neotree toggle<cr>", "Toggle Neotree" },
  d = {
    name = "Debugger",
    b = { dap.toggle_breakpoint, "Toggle Breakpoint" },
    l = { require("fzf-lua.providers.dap").breakpoints, "View All Breakpoints" },
    u = { require("dapui").toggle, "Toggle DAP UI" },
    c = { dap.continue, "Continue Execution" },
    i = { dap.step_into, "Step Into" },
    o = { dap.step_out, "Step Out" },
    p = { dap_ui.preview, "Preview" },
    f = {
      function()
        dap_ui.centered_float(dap_ui.frames)
      end,
      "View Frames",
    },
    h = { dap_ui.hover, "Hover" },
    s = {
      function()
        dap_ui.centered_float(dap_ui.scopes)
      end,
      "Scopes",
    },
    r = { dap.repl.toggle, "Toggle REPL" },
  },
}, { prefix = "<leader>" })

-- All non-prefixed keymaps
wk.register({
    K = { vim.lsp.buf.hover, "Hover" },
    g = {
      r = { function()
        require("fzf-lua").lsp_references({ jump_to_single_result = true, ignore_current_line = true })
      end, "Search References" },
      d = { function()
        require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
      end, "Go-To Definition(s)" },
      i = { function()
        require("fzf-lua").lsp_implementations({ jump_to_single_result = true })
      end, "Go-To Implementation" },
    },
    d = {
      n = { dap.step_over, "Next Line (Debugging)" },
      c = { dap.continue, "Continue (Debugging)" },
      i = { dap.step_into, "Step Into" },
      o = { dap.step_out, "Step Out" },
    },
    c = {
      a = { vim.lsp.buf.code_action, "Code Actions" },
      p = {
        r = { [[<cmd>let @+ = expand("%")<cr>]], "Copy Relative Path" },
        a = { [[<cmd>let @+ = epand("%:p")<cr>]], "Copy Absolute Path" },
      },
    },
    ["<c-h>"] = { "<c-w>h" },
    ["<c-j>"] = { "<c-w>j" },
    ["<c-k>"] = { "<c-w>k" },
    ["<c-l>"] = { "<c-w>l" },
  },
  {
    mode = "n",
    silent = true,
    nnoremap = true
  })

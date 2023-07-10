
return {
  {
    "ThePrimeagen/harpoon",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = function ()
      return {
        {
          "<leader>ha",
          require("harpoon.mark").add_file,
          desc = "Harpoon the file!"
        },
        {
          "<leader>hm",
          require("harpoon.ui").toggle_quick_menu,
          desc = "View the harpoons"
        }
      }
    end
  }
}

return {
  "dgrbrady/nvim-docker",
  dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
  rocks = "4O4/reactivex", -- ReactiveX Lua implementation
  config = function()
    local nvim_docker = require "nvim-docker"
    -- list containers
    nvim_docker.containers.list_containers()

    -- OR
    -- setting up keybindings since the `list_containers` fn does not have a default binding
    vim.keymap.set("n", "<leader>C", nvim_docker.containers.list_containers)
  end,
}

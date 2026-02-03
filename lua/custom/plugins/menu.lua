-- ~/.config/nvim/lua/plugins/menu.lua

return {
  'nvzone/menu',
  dependencies = {
    'nvim-lua/plenary.nvim', -- Required dependency for popups
  },
  config = function()
    -- Example menu
    -- Set up keybindings to open the menu
    vim.keymap.set('n', '<C-t>', function()
      require('menu').open 'default'
    end, { desc = 'Open default menu' })
    -- Add a mouse keybind for convenience
    vim.keymap.set({ 'n', 'v' }, '<RightMouse>', function()
      require('menu.utils').delete_old_menus()
      vim.cmd.exec '"normal! \\<RightMouse>"'
      require('menu').open('default', { mouse = true })
    end, {})
  end,
  -- Optional: lazy-load the plugin on an event, e.g., when the key mapping is pressed
  keys = {
    { '<C-t>', 'Open default menu' },
    { '<RightMouse>', 'Open default menu with mouse' },
  },
}

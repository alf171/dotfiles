-- mx set mark x
-- m, set next unused mark
-- m; toggle mark on or off
-- dmx delete mark x
-- dm- delete all marks on line
-- dm<space> delete all marks in current buffer
-- m],m[ move to next or prev mark
-- m:x preview mark x in floating window
-- bookmark groups things not mentioned here
return {
  'chentoast/marks.nvim',
  event = 'VeryLazy',
  opts = {
    builtin_marks = { '.', '<', '>', '`' },
    -- can consider messing with shada at some point
    force_write_shada = false,
    -- default 150
    refresh_interval = 250,
  },
}

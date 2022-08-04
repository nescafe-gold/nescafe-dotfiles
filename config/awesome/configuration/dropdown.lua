local awful = require("awful")
require("awful.autofocus")

local quake = require("utilities/quake")
awful.screen.connect_for_each_screen(function(s)
  s.quake = quake({ app = "alacritty", argname = "--title %s", extra = "--class QuakeDD", visible = true,
    height = 0.45, screen = s })
end)

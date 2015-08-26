local grid = require "mjolnir.bg.grid"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local caff = require "mjolnir.cmsj.caffeinate"
local alert = require "mjolnir.alert"
 
grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

local toggle_caffeinate = function()
    alert.show(caff.toggle('System') and 'Caffeinate On' or 'Caffeinate Off')
end

local mash = {"ctrl", "shift"}
local mashs = {"ctrl", "shift", "cmd"}
hotkey.bind(mash, 'n', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'p', grid.pushwindow_prevscreen)


hotkey.bind(mash, 'h', grid.pushwindow_left)
hotkey.bind(mash, 'j', grid.pushwindow_down)
hotkey.bind(mash, 'k', grid.pushwindow_up)
hotkey.bind(mash, 'l', grid.pushwindow_right)

hotkey.bind(mashs, 'h', grid.resizewindow_thinner)
hotkey.bind(mashs, 'j', grid.resizewindow_taller)
hotkey.bind(mashs, 'k', grid.resizewindow_shorter)
hotkey.bind(mashs, 'l', grid.resizewindow_wider)
hotkey.bind(mashs, 'm', grid.maximize_window)

hotkey.bind(mash, 'c', toggle_caffeinate)
hotkey.bind(mash, 't', test_func)
-- hotkey.bind({"cmd"}, "e", hints.windowHints)

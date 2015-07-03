local grid = require "mjolnir.sd.grid"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
-- local hints = require "mjolnir.th.hints"
local caff = require "mjolnir.cmsj.caffeinate"
local alert = require "mjolnir.alert"
 
grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

local gridset = function(x, y, w, h)
	return function()
		local cur_window = window.focusedwindow()
        if cur_window ~= nil then
            grid.set(
              cur_window,
              {x=x, y=y, w=w, h=h},
              cur_window:screen()
            )
        end
	end
end

local toggle_caffeinate = function()
    alert.show(caff.toggle('System') and 'Caffeinate On' or 'Caffeinate Off')
end

local mash = {"ctrl", "shift"}
hotkey.bind(mash, 'n', grid.pushwindow_nextscreen)
hotkey.bind(mash, 'h', gridset(0,0,1,2)) -- left half
hotkey.bind(mash, 'j', gridset(0,1,2,1)) -- lower half
hotkey.bind(mash, 'k', gridset(0,0,2,1)) -- upper half
hotkey.bind(mash, 'l', gridset(1,0,1,2)) -- right half
-- hotkey.bind(mash, 'm', grid.maximize_window) -- same as below
hotkey.bind(mash, 'm', gridset(0,0,2,2))
hotkey.bind(mash, 'c', toggle_caffeinate)
-- hotkey.bind({"cmd"}, "e", hints.windowHints)

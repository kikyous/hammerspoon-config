local hyper = {"ctrl", "shift"}

hs.window.animationDuration = 0.1

hs.loadSpoon("MiroWindowsManager")

spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  center = {hyper, "space"}
})


function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
hs.hotkey.bind(hyper, "E", open("Finder"))
hs.hotkey.bind(hyper, "W", open("企业微信"))
hs.hotkey.bind(hyper, "C", open("Google Chrome"))
hs.hotkey.bind(hyper, "Return", open("iTerm"))
hs.hotkey.bind(hyper, "V", open("Visual Studio Code"))
hs.hotkey.bind(hyper, "K", open("KeepassXC"))
hs.hotkey.bind(hyper, "T", open("TablePlus"))


require('clipboard')
require('bluetooth_sleep')
--- require('apps')



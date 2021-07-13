winChooser = hs.chooser.new(function (choice)
  if choice then
   choice.win:focus()
  end
end)


function getWins()
  local history = {}
  local wins = hs.window.visibleWindows()

  for index, win in ipairs(wins) do
    local item = {}
    item.text = '[' .. win:application():name() .. "] - " .. win:title()
    item.win = win
    table.insert(history, 1, item)
  end
  return history
end


hs.hotkey.bind({ "cmd", "shift" }, "p", function ()
  winChooser:choices(getWins())
  winChooser:show()
end)

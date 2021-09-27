clipboard = hs.chooser.new(function (choice)
  if choice then
    hs.pasteboard.setContents(choice.content)
    hs.eventtap.keyStroke({ "cmd" }, "v")
  end
end)

local history = {}

function addHistoryFromPasteboard(text)
  if not string or string.find(text, "^%s*$") then return end
  local item = {}
  item.text = string.gsub(text, "[\r\n]+", " ")
  item.content = text;

  table.insert(history, 1, item)
  history = uniq(history)
  -- table.remove(history, 50)
  history = table.slice(history, 1, 50)
end


function uniq(test)
	local hash = {}
	local res = {}

	for _,v in ipairs(test) do
	   if (not hash[v.content]) then
	       res[#res+1] = v
	       hash[v.content] = true
	   end

	end
	return res
end

function table.slice(tbl, first, last, step)
  local sliced = {}

  for i = first or 1, last or #tbl, step or 1 do
    sliced[#sliced+1] = tbl[i]
  end

  return sliced
end

hs.pasteboard.watcher.interval(0.5)
generalPBWatcher = hs.pasteboard.watcher.new(addHistoryFromPasteboard)
generalPBWatcher:start()


function toggleShow()
  if clipboard:isVisible() then
    clipboard:hide()
  else
    clipboard:choices(history)
    clipboard:show()
  end
end

hs.hotkey.bind({ "ctrl" }, "v", toggleShow)

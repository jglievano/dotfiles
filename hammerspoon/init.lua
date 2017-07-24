-- init.lua
-- J. Gabriel Lievano <gabe@jglievano.com>

hs.hotkey.alertDuration = 0
hs.hints.showTitleThresh = 0
hs.window.animationDuration = 0

white = hs.drawing.color.white
black = hs.drawing.color.black
blue = hs.drawing.color.blue
osx_red = hs.drawing.color.osx_red
osx_green = hs.drawing.color.osx_green
osx_yellos = hs.drawing.color.osx_yellow
tomato = hs.drawing.color.x11.tomato
dodgerblue = hs.drawing.color.x11.dodgerblue
firebrick = hs.drawing.color.x11.firebrick
lawngreen = hs.drawing.color.x11.lawngreen
lightseagreen = hs.drawing.color.x11.lightseagreen
purple = hs.drawing.color.x11.purple
royalblue = hs.drawing.color.x11.royalblue
sandybrown = hs.drawing.color.x11.sandybrown
black50 = {
  red = 0,
  blue = 0,
  green = 0,
  alpha = 0.5
}
darkblue = {
  red = 24 / 255,
  blue = 195 / 255,
  green = 145 / 255,
  alpha = 1
}
gray = {
  red = 246 / 255,
  blue = 246 / 255,
  green = 246 / 255,
  alpha = 0.3
}

local hyper =  {'cmd', 'alt', 'ctrl', 'shift'}

privatepath = hs.fs.pathToAbsolute(hs.configdir..'/private')

if privatepath == nil then
  hs.fs.mkdir(hs.configdir..'/private')
end
privateconf = hs.fs.pathToAbsolute(hs.configdir..'/private/config.lua')
if privateconf ~= nil then
  require('private/config')
end

hsreload_keys = hsreload_keys or {hyper, "r"}
if string.len(hsreload_keys[2]) > 0 then
  hs.hotkey.bind(hsreload_keys[1],
                 hsreload_keys[2],
                 "Reload Configuration",
                 function() hs.reload() end)
end

lockscreen_keys = lockscreen_keys or {hyper, "s"}
if string.len(lockscreen_keys[2]) > 0 then
  hs.hotkey.bind(lockscreen_keys[1],
                 lockscreen_keys[2],
                 "Lock Screen",
                 function() hs.caffeinate.lockScreen() end)
end

if modalmgr == nil then
  showtime_lkeys = showtime_lkeys or {hyper, "t"}
  if string.len(showtime_lkeys[2]) > 0 then
    hs.hotkey.bind(showtime_lkeys[1],
                   showtime_lkeys[2],
                   "Show Digital Clock",
                   function() show_time() end)
  end
end

function show_time()
  if time_draw == nil then
    local mainScreen = hs.screen.mainScreen()
    local mainRes = mainScreen:fullFrame()
    local localMainRes = mainScreen:absoluteToLocal(mainRes)
    local time_str = hs.styledtext.new(os.date("%H:%M"),
                                       {
                                         font = {
                                           name = "Impact",
                                           size = 120
                                         },
                                         color = darkblue,
                                         paragraphStyle = {
                                           alignment = "center"
                                         }
                                       })
    local timeframe = hs.geometry.rect(
      mainScreen:localToAbsolute((localMainRes.w - 300) / 2,
                                 (localMainRes.h - 200) / 2,
                                 300,
                                 150))
    time_draw = hs.drawing.text(timeframe, time_str)
    time_draw:setLevel(hs.drawing.windowLevels.overlay)
    time_draw:show()
    if ttimer == nil then
      ttimer = hs.timer.doAfter(4,
        function() time_draw:delete() time_draw=nil end)
    else
      ttimer:start()
    end
  else
    ttimer:stop()
    time_draw:delete()
    time_draw=nil
  end
end

showhotkey_keys = showhotkey_keys or {hyper, "space"}
if string.len(showhotkey_keys[2]) > 0 then
  hs.hotkey.bind(showhotkey_keys[1],
                 showhotkey_keys[2],
                 "Toggle Hotkeys Cheatsheet",
                 function() showavailableHotkey() end)
end

function showavailableHotkey()
  if not hotkeyText then
    local hotkey_list = hs.hotkey.getHotkeys()
    local mainScreen = hs.screen.mainScreen()
    local mainRes = mainScreen:fullFrame()
    local localMainRes = mainScreen:absoluteToLocal(mainRes)
    local hkbgrect = hs.geometry.rect(
        mainScreen:localToAbsolute(localMainRes.w / 5,
                                   localMainRes.h / 5,
                                   localMainRes.w / 5 * 3,
                                   localMainRes.h / 5 * 3))
    hotkeybg = hs.drawing.rectangle(hkbgrect)
    if not hotkey_tips_bg then hotkey_tips_bg = "light" end
    if hotkey_tips_bg == "light" then
      hotkeybg:setFillColor({
        red = 238 / 255,
        blue = 238 / 255,
        green = 238 / 255,
        alpha = 0.95
      })
    elseif hotkey_tips_bg == "dark" then
      hotkeybg:setFillColor({
        red = 0,
        blue = 0,
        green = 0,
        alpha = 0.95
      })
    end
    hotkeybg:setRoundedRectRadii(10, 10)
    hotkeybg:setLevel(hs.drawing.windowLevels.modalPanel)
    hotkeybg:behavior(hs.drawing.windowBehaviors.stationary)
    local hktextrect = hs.geometry.rect(hkbgrect.x + 40,
                                        hkbgrect.y + 30,
                                        hkbgrect.w - 80,
                                        hkbgrect.h - 60)
    hotkeytext = hs.drawing.text(hktextrect, "")
    hotkeytext:setLevel(hs.drawing.windowLevels.modalPanel)
    hotkeytext:behavior(hs.drawing.windowBehaviors.stationary)
    hotkeytext:setClickCallback(nil, function()
      hotkeytext:delete()
      hotkeytext = nil
      hotkeybg:delete()
      hotkeybg = nil
    end)
    hotkey_filtered = {}
    for i = 1, #hotkey_list do
      if hotkey_list[i].idx ~= hotkey_list[i].msg then
        table.insert(hotkey_filtered, hotkey_list[i])
      end
    end
    local availablelen = 70
    local hkstr = ''
    for i = 2, #hotkey_filtered, 2 do
      local tmpstr = hotkey_filtered[i - 1].msg .. hotkey_filtered[i].msg
      if string.len(tmpstr)<= availablelen then
        local tofilllen = availablelen - string.len(hotkey_filtered[i - 1].msg)
        hkstr = hkstr .. hotkey_filtered[i - 1].msg ..
          string.format('%'..tofilllen..'s',hotkey_filtered[i].msg) .. '\n'
      else
        hkstr = hkstr .. hotkey_filtered[i - 1].msg .. '\n' ..
          hotkey_filtered[i].msg .. '\n'
      end
    end
    if math.fmod(#hotkey_filtered, 2) == 1 then
      hkstr = hkstr .. hotkey_filtered[#hotkey_filtered].msg
    end
    local hkstr_styled =
        hs.styledtext.new(hkstr,
                          {
                            font = {
                              name = "Courier-Bold",
                              size = 16
                            },
                            color = dodgerblue,
                            paragraphStyle = {
                              lineSpacing = 12.0,
                              lineBreak = 'trancateMiddle'
                            },
                            shadow = {
                              offset = {
                                h = 0,
                                w = 0
                              },
                              blurRadius = 0.5,
                              color = darkblue
                            }
                          })
    hotkeytext:setStyledText(hkstr_styled)
    hotkeybg:show()
    hotkeytext:show()
  else
    hotkeytext:delete()
    hotkeytext = nil
    hotkeybg:delete()
    hotkeybg = nil
  end
end

modal_list = {}

function modal_stat(color, alpha)
  if not modal_tray then
    local mainScreen = hs.screen.mainScreen()
    local mainRes = mainScreen:fullFrame()
    local localMainRes = mainScreen:absoluteToLocal(mainRes)
    modal_tray = hs.canvas.new(
        mainScreen:localToAbsolute(
            {
              x = localMainRes.w - 40,
              y = localMainRes.h - 40,
              w = 20,
              h=20
            }))
    modal_tray[1] = {
      action = "fill",
      type = "circle",
      fillColor = white
    }
    modal_tray[1].fillColor.alpha = 0.7
    modal_tray[2] = {
      action = "fill",
      type = "circle",
      fillColor = white,
      radius = "40%"
    }
    modal_tray:level(hs.canvas.windowLevels.status)
    modal_tray:clickActivating(false)
    modal_tray:behavior(hs.canvas.windowBehaviors.canJoinAllSpaces + hs.canvas.windowBehaviors.stationary)
    modal_tray._default.trackMouseDown = true
  end
  modal_tray:show()
  modal_tray[2].fillColor = color
  modal_tray[2].fillcolor.alpha = alpha
end

active_modals = {}
function exit_others(excepts)
  function is_in_excepts(value, tbl)
    for i = 1, #tbl do
      if tb[i] == value then
        return true
      end
    end
    return false
  end
  if excepts == nil then excepts = {} end
  for i = 1, #active_modals do
    if not is_in_excepts(active_modals[i].id, excepts) then
      active_modals[i].modal:exot()
    end
  end
end

function resize_win(direction)
  local win = hs.window.focusedWindow()
  if win then
    local f = win:frame()
    local screen = win:screen()
    local localf = screen:absoluteToLocal(f)
    local max = screen:fullFrame()
    local stepw = max.w / 30
    local steph = max.h / 30
    if direction == "right" then
      localf.w = localf.w + stepw
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "left" then
      localf.w = localf.w - stepw
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "up" then
      localf.h = localf.h - steph
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "down" then
      localf.h = localf.h + steph
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "halfright" then
      localf.x = max.w / 2
      localf.y = 0
      localf.w = max.w / 2
      localf.h = max.h
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "halfleft" then
      localf.x = 0
      localf.y = 0
      localf.w = max.w / 2
      localf.h = max.h
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "halfup" then
      localf.x = 0
      localf.y = 0
      localf.w = max.w
      localf.h = max.h / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "halfdown" then
      localf.x = 0
      localf.y = max.h / 2
      localf.w = max.w
      localf.h = max.h / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "cornerNE" then
      localf.x = max.w / 2
      localf.y = 0
      localf.w = max.w / 2
      localf.h = max.h / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "cornerSE" then
      localf.x = max.w / 2
      localf.y = max.h / 2
      localf.w = max.w / 2
      localf.h = max.h / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "cornerNW" then
      localf.x = 0
      localf.y = 0
      localf.w = max.w / 2
      localf.h = max.h / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "cornerSW" then
      localf.x = 0
      localf.y = max.h / 2
      localf.w = max.w / 2
      localf.h = max.h / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "center" then
      localf.x = (max.w - localf.w) / 2
      localf.y = (max.h - localf.h) / 2
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolute)
    end
    if direction == "fcenter" then
      localf.x = 40
      localf.y = 40
      localf.w = max.w - 80
      localf.h = max.h - 80
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "fullscreen" then
      localf.x = 0
      localf.y = 0
      localf.w = max.w
      localf.h = max.h
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "shrink" then
      localf.x = localf.x + stepw
      localf.y = localf.y + steph
      localf.w = localf.w - (stepw * 2)
      localf.h = localf.h - (steph * 2)
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "expand" then
      localf.x = localf.x - stepw
      localf.y = localf.y - steph
      localf.w = localf.w + (stepw * 2)
      localf.h = localf.h + (steph * 2)
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "mright" then
      localf.x = localf.x + stepw
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "mleft" then
      localf.x = localf.x - stepw
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "mup" then
      localf.y = localf.y - steph
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "mdown" then
      localf.y = localf.y + steph
      local absolutef = screen:localToAbsolute(localf)
      win:setFrame(absolutef)
    end
    if direction == "ccursor" then
      localf.w = localf.x + localf.w / 2
      localf.y = localf.y + localf.h / 2
      hs.mouse.setRelativePosition({
        x = localf.x,
        y = localf.y
      }, screen)
    end
  else
    hs.alert.show("No focused window.")
  end
end

resize_lefthalf_keys = resize_lefthalf_keys or {hyper, "h"}
if string.len(resize_lefthalf_keys[2]) > 0 then
  hs.hotkey.bind(resize_lefthalf_keys[1],
                 resize_lefthalf_keys[2],
                 "Lefthalf of Screen",
                 function() resize_win('halfleft') end)
end
resize_righthalf_keys = resize_righthalf_keys or {hyper, "l"}
if string.len(resize_righthalf_keys[2]) > 0 then
  hs.hotkey.bind(resize_righthalf_keys[1],
                 resize_righthalf_keys[2],
                 "Righthalf of Screen",
                 function() resize_win('halfright') end)
end
resize_fullscreen_keys = resize_fullscreen_keys or {hyper, "k"}
if string.len(resize_fullscreen_keys[2]) > 0 then
  hs.hotkey.bind(resize_fullscreen_keys[1],
                 resize_fullscreen_keys[2],
                 "Fullscreen",
                 function() resize_win('fullscreen') end)
end
resize_fcenter_keys = resize_fcenter_keys or {hyper, "j"}
if string.len(resize_fcenter_keys[2]) > 0 then
  hs.hotkey.bind(resize_fcenter_keys[1],
                 resize_fcenter_keys[2],
                 "Resize & Center",
                 function() resize_win('fcenter') end)
end
resize_center_keys = resize_center_keys or {hyper, "return"}
if string.len(resize_center_keys[2]) > 0 then
  hs.hotkey.bind(resize_center_keys[1],
                 resize_center_keys[2],
                 "Center Window",
                 function() resize_win('center') end)
end


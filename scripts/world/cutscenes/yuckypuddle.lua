return function(cutscene)

  local function gonerText(str, x, y)
    local text = DialogueText("[speed:0.3][spacing:6][style:GONER][voice:none]" .. str, 80 * 2+x, 50 * 2+y, 640, 480, {auto_size = false})
    text.layer = WORLD_LAYERS["top"] + 100
    text.skip_speed = true
    text.parallax_x = 0
    text.parallax_y = 0
    Game.world:addChild(text)
    
    cutscene:wait(function() return text.done end)
    Game.world.timer:tween(1, text, {alpha = 0})
    cutscene:wait(1)
    text:remove()
  end
  --Game.world:loadMap("INTRO")
  cutscene:wait(1)
  --cutscene:detachCamera()
  local nellie = cutscene:getCharacter("nellie")
  --cutscene:slideTo(nellie, 320, -30, 3, "out-bounce")
  local x = 320
  local y = -10
  cutscene:wait(1) -- waits 1 second
  --gonerText("                                       WARNING:\n[wait:5]This mod contains multiple Fourth wall breaking events that may contain your private username, randomly crashing the game purposefully, and opening important files.", -150,-100)
  --gonerText("Most of these cannot be disabled as they create the beautiful timelines of NELLIE!TALE and allows the story to flow efficiently, but you may disable the username being used HERE", -150,-80)
     --Mod.doxxedurass = cutscene:choicer({"Disable", "Enable"}, {skip = false})
     --if Mod.doxxedurass == 2 then
       --gonerText("You selected to \nEnable Username \nusage, if this \nis incorrect \nplease close \nthe application \nnow.", 1, 1)
       --cutscene:wait(3)
     --else
       --gonerText("You selected to \nDisable Username \nusage, I will \nnow call you \nPLAYER.", 1, 1)
     --end
  --lechoice
  cutscene:text("* Oh drat these puddles of... [wait:5]I don't even want to know...")
  cutscene:text("* [wait:3]Oh dang its you again...")
  local X2 = cutscene:getCharacter("Xz43yx7hNxI3", 2)
  cutscene:wait(cutscene:walkTo(X2, 1872, 712, 0.1))
  cutscene:endCutscene()

--love.system.openURL("file://"..love.filesystem.getRealDirectory(Mod.info.path).."/"..Mod.info.path.."/hehe.txt")
  --love = nil
  

end







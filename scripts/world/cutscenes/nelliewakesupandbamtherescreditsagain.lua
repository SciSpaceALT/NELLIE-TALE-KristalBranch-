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

  Game.world:loadMap("nellieroom")
  cutscene:wait(1)
  cutscene:detachCamera()
  local nellie = cutscene:getCharacter("nellie")
  cutscene:slideTo(nellie, 320, -30, 3, "out-bounce")
  local x = 320
  local y = -10
  cutscene:wait(1) -- waits 1 second
  gonerText("                                       WARNING:\n[wait:5]This mod contains multiple Fourth wall breaking events that may contain your private username, randomly crashing the game purposefully, and opening important files.", -150,-100)
  gonerText("Most of these cannot be disabled as they create the beautiful timelines of NELLIE!TALE and allows the story to flow efficiently, but you may disable the username being used HERE", -150,-80)
     Mod.doxxedurass = cutscene:choicer({"Disable", "Enable"}, {skip = false})
     if Mod.doxxedurass == 2 then
       gonerText("You selected to \nEnable Username \nusage, if this \nis incorrect \nplease close \nthe application \nnow.", 1, 1)
       cutscene:wait(3)
     else
       gonerText("You selected to \nDisable Username \nusage, I will \nnow call you \nPLAYER.", 1, 1)
     end
  --lechoice
  --cutscene:text("* ...")
  --cutscene:text("* [wait:1]Seems like your new here...")
     if Mod.doxxedurass == 2 then
       Mod.username = os.getenv('USERNAME')
       gonerText("HELLO " ..Mod.username.. "...", 1, 1)
       cutscene:wait(3)
     else
       Mod.username = "PLAYER"
       gonerText("HELLO PLAYER...", 1, 1)
     end
     gonerText("IT'S BEEN A LONG TIME.", -20, 1)
     gonerText("YOUR PROBABLY LOOKING \nFOR SOMETHING TO SEE \nAROUND HERE.", -120, 1)
     gonerText("WELL, HAVE I GOT \nSOMETHING FOR YOU.", -20, 1)
     cutscene:slideTo(nellie, 320, 1600, 3, "linear")
     gonerText("MEET NELLIE...", 0, 1)
     gonerText("YOU PROBABLY THINK \nI'LL GIVE HER TO YOU \nAS A VESSEL.", -50, 1)
     gonerText("WELL THATS NOT \nHOW IT WORKS \nIN THIS WORLD...", -20, 1)
     gonerText("IN [wait:5]HER[wait:2] WORLD.[wait:2].[wait:2].[wait:2]", 0, 1)
     --shoot her back up
     cutscene:slideTo(nellie, 320, -30, 3, "out-bounce")
     gonerText("WELCOME "..Mod.username.." TO NELLIE!TALE.", -160, -80)
 --must be finished
  --cutscene:wait(3)
  Assets.playSound("hurt")
  Assets.playSound("damage")
  --you get yeeted here
  nellie:setAnimation("jump_ball")
  --cutscene:text("* [wait:2]Welcome,[wait:15] to NELLIETALE", {auto = true})
  Game.world.music:play("Its_All_A_Bad_Dream")
  local title_sprite = Sprite("title", 10, 20)
  title_sprite.layer = 1000
  title_sprite.alpha = 0
  Game.stage:addChild(title_sprite)
  cutscene:attachCamera()
  Game.stage.timer:tween(3, title_sprite, {alpha = 1})
  cutscene:attachCamera()
  cutscene:wait(3)
  Game.stage.timer:tween(0.5, title_sprite, {alpha = 0})
  cutscene:wait(1)
  cutscene:slideTo(nellie, 320, 580, 34567, "out-linear")
  cutscene:slideTo(nellie, 320, 580, 1, "out-expo")
  cutscene:panTo(320, 580, 1, "out-expo")
  cutscene:wait(3)
  cutscene:slideTo(nellie, 320, 945, 1, "out-expo")
  cutscene:panTo(320, 945, 1, "out-expo")
  cutscene:wait(3)
  cutscene:slideTo(nellie, 320, 1315, 1, "out-expo")
  cutscene:panTo(320, 1315, 1, "out-expo")
  cutscene:wait(3)
  cutscene:slideTo(nellie, 320, 1880, 1, "out-expo")
  cutscene:panTo(320, 1880, 1, "out-expo")
  cutscene:wait(3)
  cutscene:slideTo(nellie, 320, 2300, 1, "out-expo")
  cutscene:panTo(320, 2300, 1, "out-expo")
  cutscene:wait(3)
  cutscene:slideTo(nellie, 320, 2675, 1, "out-expo")
  cutscene:panTo(320, 2675, 1, "out-expo")
  cutscene:wait(3)
  cutscene:slideTo(nellie, 320, 3300, 1, "out-expo")
  cutscene:panTo(320, 3300, 1, "out-expo")
  cutscene:wait(3)
 --love.system.openURL("file://"..love.filesystem.getRealDirectory(Mod.info.path).."/"..Mod.info.path.."/hehe.txt")
  --love = nil
  cutscene:fadeOut(0.5, {color = {1, 1, 1}})
  Game.world:loadMap("dream")
  cutscene:wait(1)
  local nellie = cutscene:getCharacter("nellie")
  nellie:setSprite("sit")
  cutscene:fadeIn(1.5, {color = {1, 1, 1}})
  cutscene:wait(2)
  cutscene:text("* [wait:20]Ouch[wait:5].[wait:5].[wait:5].[wait:20]",{auto = true})
  nellie:setSprite("walk")
  cutscene:text("* [wait:10]Where-[wait:7] Am I?[wait:30]",{auto = true})
  --Mod.lightbridge.alpha = 0
  --cutscene:text("* The cutscene would supposedly end here, the screen would light up and you would drop down onto a cliff")
  --cutscene:walkTo(kris, x, y + 40, 0.75, "up")
  --cutscene:walkTo(kris, x, y - 80, 0.75, "up")
  --cutscene:setSpeaker(kris)
  --cutscene:text("* Hey,[wait:5] think I can break\nthis wall?")
  -- cutscene ends
  Game.world.music:play("Its_All_A_Bad_Dream")

end








function Mod:init()
    print("Loaded "..self.info.name.."!")
    print("Enjoy a new story  ; ) -SciSpace")
    Mod.TimeDays = 0
    Utils.hook(Map, "load", function(orig, self, ...)
      orig(self, ...)
      Mod:toggleFlying(false, self)
      Mod.heavyweather = nil
      Mod.bridgeable = nil
      Mod.Cheeriness = "default"
      --Mod.toggleBridge(false, self)
    end)
end

function Mod:postInit(new_file)
    if new_file then
        --CH_1
        Game:setFlag("PocketJevil", "false")
        Game:setFlag("Pocket___","false")
        Game:setFlag("PocketEggcat", "false")
        Game:setFlag("PocketCluwneer", "false")
        Game:setFlag("PocketTheatricana","false")
        Game:setFlag("PocketGalaria","false")
        Game:setFlag("PocketDraco",'false')
        Game:setFlag("PocketCandelaria","false")
        Game:setFlag("PocketMarvin","false")--LORAX IN DELTARUEN REAL!?!?!?
        --CH_2
        Game:setFlag("PocketSpamton", "DIRTY [HACKER]] th1s is m7 PERS0N4L D4T4!!! [[screw off]]  !!") --Sorry bub you are unused :<
        Game.world:startCutscene("introcredits")
        Game.inventory:addItemTo("spells", "fly")
        Game.inventory:addItemTo("POCKETACTIONS", "talk")
        --Game.inventory:addItemTo("spells", "lightbridge") Unfortuantly, had to be cut, sorry peopel :<
        Mod.heavyweather = nil
    end
end

function Mod:createDarkInventory(inventory)

    inventory.storages["spells"] = {id = "spells", max = 99, sorted = true,  name = "SPELLS",   fallback = nil      }
    inventory.storages["POCKETCHATTER"] = {id = "pocketchatter", max = 99, sorted = true,  name = "pocketchatter",   fallback = nil      }
    inventory.storages["POCKETACTIONS"] = {id = "POCKETACTIONS", max = 99, sorted = true,  name = "pocketchatter",   fallback = nil      }

end

function Mod:toggleFlying(flying, map)
  map = map or Game.world.map
  for _,hitbox in ipairs(map.collision) do
    hitbox.collidable = not flying
  end
  local fly_collision = map:getShapeLayer("collision_fly")
  if fly_collision then
    for _,shape in ipairs(fly_collision.objects) do
      map:getHitbox(shape.id).collidable = flying
    end
  end
end
--i stoopid i needs a beter sysem
--function Mod:toggleBridge(bridgeing, map)
--  map = map or Game.world.map
--  for _,hitbox in ipairs(map.collision) do
--    hitbox.collidable = not bridgeing
--  end
--  local bridge_collision = map:getShapeLayer("collision_bridge")
--  Mod.lightbridge = map:getImageLayer("LIGHTBRIDGE")
--  if bridge_collision then
--    for _,shape in ipairs(bridge_collision.objects) do
--      map:getHitbox(shape.id).collidable = bridgeing
--    end
--  end
--  if Mod.lightbridge then
--    if bridgeing then
--      Mod.lightbridge.alpha = 0
--    end
--  end
--end

function Mod:postUpdate()
  Mod.TimeMinutes = Game.playtime/60 
  Mod.TimeMinutesPure = math.floor(Mod.TimeMinutes % 60)
  --Mod.TimeDays = 0
  Mod.TimeHours = math.floor(Mod.TimeMinutes/60) % 24 + 1
  Mod.TimeDays = math.floor(Mod.TimeHours/24) + 1
  Game:setFlag("Days", Mod.TimeDays)
end


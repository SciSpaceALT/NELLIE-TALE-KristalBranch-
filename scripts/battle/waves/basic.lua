local Basic, super = Class(Wave)

function Basic:onStart()
    local stardir = math.rad(180)
    -- Every 0.33 seconds...
    self.timer:every(1/6, function()
        -- Our X position is offscreen, to the right
        local bx = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local by = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
		local starx = SCREEN_WIDTH - SCREEN_WIDTH + 30
		local stary = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
		local stardir = stardir + Utils.random(-30,30)
		local starspeed = Utils.random(2, 20)
        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        self:spawnBullet("smallbullet", bx, by, math.rad(180), 8)
        self:spawnBullet("smallstar", starx, stary, stardir, starspeed)
    end)
end

return Basic
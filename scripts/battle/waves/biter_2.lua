local biter_2, super = Class(Wave)

function biter_2:onStart()
    local leftstardir = math.rad(90)
    local rightstardir = math.rad(-90)
    local topstardir = math.rad(180)
    local bottomstardir = math.rad(0)
    -- Every 0.33 seconds...
    self.timer:every(1/3, function()
        -- Our X position is offscreen, to the right
        local bx = SCREEN_WIDTH + 20
        -- Get a random Y position between the top and the bottom of the arena
        local by = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
		local leftstarx = SCREEN_WIDTH - SCREEN_WIDTH + 30
                     local rightstarx = SCREEN_WIDTH - 30
                     local topstarx = Utils.random(120, 200)
                     local bottomstarx = Utils.random(120, 250)
		local leftstary = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)--20,200
		local rightstary = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)--20,200
		local topstary = SCREEN_HEIGHT - SCREEN_HEIGHT + 30
		local bottomstary = SCREEN_HEIGHT - 30
		local leftstardir = leftstardir + Utils.random(-30,30)
		local rightstardir = rightstardir + Utils.random(-30,30)
		local topstardir = rightstardir + Utils.random(-30,30)
		local bottomstardir = rightstardir + Utils.random(-30,30)
		local leftstarspeed = Utils.random(2, 20)
		local rightstarspeed = Utils.random(2, 20)
		local topstarspeed = Utils.random(2, 20)
		local bottomstarspeed = Utils.random(2, 20)
                     local starspeed = Utils.random(4, 12)
        -- Spawn smallbullet going left with speed 8 (see scripts/battle/bullets/smallbullet.lua)
        --self:spawnBullet("smallbullet", bx, by, math.rad(180), 8)
        --left
        --self:spawnBullet("smallstar", leftstarx, leftstary, leftstardir, leftstarspeed)
        --right
        --self:spawnBullet("smallstar", rightstarx, rightstary, rightstardir, rightstarspeed)
        --top
        self:spawnBullet("smallstar", topstarx, topstary, topstardir, topstarspeed)  
        --bottom
        self:spawnBullet("smallstar", bottomstarx, bottomstary, bottomstardir, bottomstarspeed)      
        --biter boi
        local by = Utils.random(Game.battle.arena.top, Game.battle.arena.bottom)
        self:spawnBullet("biter", SCREEN_WIDTH - 30, by, math.rad(180), starspeed)
    end)
end

return biter_2
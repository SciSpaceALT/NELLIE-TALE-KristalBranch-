local Biter, super = Class(Bullet)

function Biter:init(x, y, dir, speed)
    -- Last argument = sprite path
    super:init(self, x, y, "bullets/Nightmarion/nightmare_dust")

    -- Move the bullet in dir radians (0 = right, pi = left, clockwise rotation)
    self.physics.direction = dir
    -- Speed the bullet moves (pixels per frame at 30FPS)
    self.physics.speed = speed

    -- Dont remove this bullet offscreen, because the "basic" wave spawns it offscreen
    self.remove_offscreen = false
end

return Biter
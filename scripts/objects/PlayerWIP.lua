local Player, super = Class(Player)

function Player:init(...)
    super:init(self, ...)

        self.state_manager:addState("FLY", {enter = self.beginFly, update = self.updateFly, leave = self.endFly})
end

function Player:beginFly(last_state, tx, ty, hop_time, hop_height)
    self.auto_moving = true
    Assets.playSound("smalljump")
    self.fly_timer = 0
    self.fly_walk_speed = self.sprite.walk_speed
    self.fly_start_x = self.x
    self.fly_start_y = self.y
    self.fly_target_x = tx or self.x
    self.fly_target_y = ty or self.y
    self.fly_speed = hop_time or 0.5
    self.fly_height = hop_height or 20
end
function Player:updateHop()
    self.hop_timer = self.hop_timer + DT

    self.x = Utils.lerp(self.hop_start_x, self.hop_target_x, self.hop_timer / self.hop_speed)
    self.y = Utils.lerp(self.hop_start_y, self.hop_target_y, self.hop_timer / self.hop_speed)

    local half_hop = self.hop_speed / 2
    if self.hop_timer < half_hop then
        self.sprite.y = Utils.ease(0, -self.hop_height, self.hop_timer / half_hop, "out-cubic")
    elseif self.hop_timer < self.hop_speed then
        self.sprite.y = Utils.ease(-self.hop_height, 0, (self.hop_timer - half_hop) / half_hop, "in-cubic")
    end

    self.moved = math.max(4, self.hop_walk_speed)

    self:moveCamera(100)

    if self.hop_timer >= self.hop_speed then
        self:setState("WALK")
    end
end
function Player:endHop()
    self.auto_moving = false
    self.x = self.hop_target_x
    self.y = self.hop_target_y
    self.sprite.y = 0
end

return Player
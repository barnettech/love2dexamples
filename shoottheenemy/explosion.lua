Explosion = Object:extend()


function Explosion:new()
    self.image = love.graphics.newImage("explosion.jpg")
    self.x = 325
    self.y = 450
    self.speed = 100
    self.width = self.image:getWidth()
    self.height = self.image:getHeight()
end

function Explosion:update(dt)
   end

function Explosion:draw()
    love.graphics.draw(self.image, self.x, self.y)
end

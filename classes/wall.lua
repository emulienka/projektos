local Object = require "floof.object"

local Wall = Object:class("Wall")

function Wall:__init(x, y, w, h)
    self.super.__init(self)
    
    self.x = x
    self.y = y
    self.w = w
    self.h = h
end

function Wall:draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill",
        self.x - self.w/2,
        self.y - self.h/2,
        self.w,
        self.h
    )
end

return Wall
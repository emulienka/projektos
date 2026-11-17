local Element = require "floof.element"

local Title = Element:class("Title")

Title.font = love.graphics.newFont(60)
Title.color = {1, 1, 1}

Element.registerHandler("resize", function(w, h)
    Title.font = love.graphics.newFont(h * 0.2)
end)

function Title:draw()
    love.graphics.setColor(self.color)
    local tw, th = self.font:getWidth(self.text), self.font:getHeight()
    local s = math.min(self.w/tw, self.h/th)
    love.graphics.print(self.text, self.font, self.x - tw*s/2, self.y - th*s/2, 0, s)
end

return Title
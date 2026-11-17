local Element = require "floof.element"

local Button = Element:class("Button")

Button.backgroundColor = {0, 0, 0}

Button.outlineWidth = 3
Button.outlineColor = {1, 1, 1}

Button.font = love.graphics.newFont(20)
Button.textColor = {1, 1, 1}

Element.registerHandler("resize", function(w, h)
    Button.font = love.graphics.newFont(h * 0.05)
end)

function Button:draw()
    love.graphics.setColor(self.backgroundColor)
    love.graphics.rectangle("fill", self.l, self.t, self.w, self.h)

    love.graphics.setColor(self.outlineColor)
    love.graphics.setLineWidth(self.outlineWidth)
    love.graphics.rectangle("line", self.l, self.t, self.w, self.h)

    love.graphics.setColor(self.textColor)
    local tw, th = self.font:getWidth(self.text), self.font:getHeight()
    local s = math.min(self.w/tw, self.h/th)
    love.graphics.print(self.text, self.font, self.x - tw*s/2, self.y - th*s/2, 0, s)
end

return Button
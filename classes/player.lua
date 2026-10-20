local Object = require "floof.object"

local Wall = require "classes.wall"
local Player = Object:class("Player")

function Player:__init(x, y)
    self.super.__init(self)
    self.z = 1

    self.x = x
    self.y = y
    self.w = 50
    self.h = 50
    self.collisions = {}
end

function Player:update(dt)
    local px, py = self.x, self.y
    if love.keyboard.isDown("w") then self.y = self.y - 200 * dt end
    if love.keyboard.isDown("a") then self.x = self.x - 200 * dt end
    if love.keyboard.isDown("s") then self.y = self.y + 200 * dt end
    if love.keyboard.isDown("d") then self.x = self.x + 200 * dt end
    self.collisions = {}
    if self.parent then
        for sibling in self.parent:backToFront() do
            if sibling:instanceOf(Wall) then
                if math.abs(self.x - sibling.x) <= (self.w/2 + sibling.w/2) and
                   math.abs(self.y - sibling.y) <= (self.h/2 + sibling.h/2)
                then
                    if math.abs(px - sibling.x) >= (self.w/2 + sibling.w/2) and
                       math.abs(self.y - sibling.y) < (self.h/2 + sibling.h/2)
                    then
                        if px < sibling.x then
                            self.x = sibling.x - self.w/2 - sibling.w/2
                            self.collisions.right = sibling
                        else
                            self.x = sibling.x + self.w/2 + sibling.w/2
                            self.collisions.left = sibling
                        end
                    end
                    if math.abs(py - sibling.y) >= (self.h/2 + sibling.h/2) and
                       math.abs(self.x - sibling.x) < (self.w/2 + sibling.w/2)
                    then
                        if py < sibling.y then
                            self.y = sibling.y - self.h/2 - sibling.h/2
                            self.collisions.down = sibling
                        else
                            self.y = sibling.y + self.h/2 + sibling.h/2
                            self.collisions.up = sibling
                        end
                    end
                end
            end
        end
    end
end

function Player:draw()
    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill",
        self.x - self.w/2,
        self.y - self.h/2,
        self.w,
        self.h
    )
end

return Player
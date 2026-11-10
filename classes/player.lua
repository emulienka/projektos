local Object = require "floof.object"

local Wall = require "classes.wall"
local Player = Object:class("Player")

function Player:__init(scene, x, y)
    self.super.__init(self)
    self.parent = scene
    self.z = 1

    self.x = x
    self.y = y
    self.w = 50
    self.h = 50
    self.collisions = {}
    self.speed = 200
end

function Player:update(dt)
    local px, py = self.x, self.y
    if love.keyboard.isDown("w") then self.y = self.y - self.speed * dt end
    if love.keyboard.isDown("a") then self.x = self.x - self.speed * dt end
    if love.keyboard.isDown("s") then self.y = self.y + self.speed * dt end
    if love.keyboard.isDown("d") then self.x = self.x + self.speed * dt end
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
    love.graphics.setColor(0, 1, 0)
    love.graphics.setLineWidth(2)
    if self.collisions.left then
        love.graphics.line(
            self.x - self.w/2, self.y - self.h/2,
            self.x - self.w/2, self.y + self.h/2
        )
    end
    if self.collisions.right then
        love.graphics.line(
            self.x + self.w/2, self.y - self.h/2,
            self.x + self.w/2, self.y + self.h/2
        )
    end
    if self.collisions.up then
        love.graphics.line(
            self.x - self.w/2, self.y - self.h/2,
            self.x + self.w/2, self.y - self.h/2
        )
    end
    if self.collisions.down then
        love.graphics.line(
            self.x - self.w/2, self.y + self.h/2,
            self.x + self.w/2, self.y + self.h/2
        )
    end
end

return Player
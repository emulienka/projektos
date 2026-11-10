local Scene = require "classes.scene"
local Object = require "floof.object"

local Wall = require "classes.wall"
local Player = require "classes.player"

local Game = Scene:class("Game")

function Game:initialized()
    Player(self, 100, 100)

    Wall(self, 350,  25, 700,  50)
    Wall(self,  25, 250,  50, 500)
    Wall(self, 325, 125,  50, 250)
    Wall(self, 250, 225, 200,  50)
end

return Game
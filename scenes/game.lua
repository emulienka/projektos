local Object = require "floof.object"

local Wall = require "classes.wall"
local Player = require "classes.player"

local Game = Object({

},

    Player(100, 100),

    Wall(350,  25, 700,  50),
    Wall( 25, 250,  50, 500),
    Wall(325, 125,  50, 250),
    Wall(250, 225, 200,  50)
)

return Game
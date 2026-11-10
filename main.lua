floof = require "floof"

Object = floof.object
Object.initialize(arg)

Scene = require "classes.scene"

GameScene = require "scenes.game"

Scene.switch(GameScene())
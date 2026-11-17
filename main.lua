floof = require "floof"

Object = floof.object

Scene = require "classes.scene"

MenuScene = require "scenes.menu"
GameScene = require "scenes.game"

Object.initialize(arg)

Scene.switch(MenuScene())
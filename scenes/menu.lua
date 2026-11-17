local Scene = require "classes.scene"
local Element = require "floof.element"

local Title = require "classes.title"
local Button = require "classes.button"

local Menu = Scene:class("Menu")

function Menu:initialized()
    self.container = Element{
        parent = self,
        inLayout = false,
        align = "stretch-expand",
        layoutDirection = "column",
        justifyChildren = "middle",
        alignChildren = "center",
        spacing = "5%"
    }
    
    self.title = Title{
        parent = self.container,
        width = "50%",
        height = "20%",
        text = "Projektos"
    }
--[[
    self.playButton = Button{
        parent = self.container,
        width = "20%",
        height = "5%",
        text = "Play"
    }
]]--
end

return Menu
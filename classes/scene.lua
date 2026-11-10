local Object = require "floof.object"
local array = require "floof.array"

local Scene = Object:class("Scene")

Scene.stack = array()

function Scene.switch(target, ...)
    local previous = Scene.current
    if previous then
        previous.activeSelf = false
        previous:call("leave", target, ...)
    end
    if target then
        Scene.current = target
        target.activeSelf = false
        target:call("enter", Scene.current, ...)
    end
    previous:delete()
    for i, scene in Scene.stack:iterate() do
        scene:delete()
    end
    Scene.stack = array()
end

function Scene.push(target, ...)
    local previous = Scene.current
    if previous then
        previous.activeSelf = false
        previous:call("leave", target, ...)
    end
    if target then
        Scene.current = target
        target.activeSelf = false
        target:call("enter", previous, ...)
    end
    Scene.stack:push(previous)
end

function Scene.pop(...)
    local previous = Scene.current
    local target = Scene.stack:pop()
    if previous then
        previous.activeSelf = false
        previous:call("leave", target, ...)
    end
    if target then
        Scene.current = target
        target.activeSelf = true
        target:call("enter", previous, ...)
    end
    previous:delete()
end

return Scene
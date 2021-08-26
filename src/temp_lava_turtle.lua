function returnHome(ppath, ppath_index, pTurnRight)
    t = pTurnRight
    turtle.turnLeft()
    turtle.turnLeft()
    for i=ppath_index,1,-1 do
        for j=ppath[i],1,-1 do
            turtle.forward()
        end
        if t then
            turtle.turnRight()
        else
            turtle.turnLeft()
        end
        turtle.forward()
        if t then
            turtle.turnRight()
        else
            turtle.turnLeft()
        end
        t = not t
    end
    turtle.turnLeft()
    turtle.turnLeft()
    for i=1,16 do
        turtle.select(i)
        turtle.place()
    end
end

path = {0}
path_index = 1
goRight = true
buckets = 0
t, res = turtle.inspect()
while true do
    if t and (res.name == "minecraft:lava" or res.name == "minecraft:flowing_lava") then
        turtle.place()
        buckets = buckets + 1
        if buckets == 16 then
            turtle.refuel()
        end
        if buckets == 17 then
            returnHome(path, path_index, turnRight)
            return
        end
    end
    if not turtle.forward() then
        if goRight then
            turtle.turnRight()
        else
            turtle.turnLeft()
        end
        t, res = turtle.inspect()
        while (not t) or not (res.name == "minecraft:lava" or res.name == "minecraft:flowing_lava") do
            if goRight then
                turtle.turnRight()
            else
                turtle.turnLeft()
            end
            turtle.forward()
            path[path_index] = path[path_index]-1
            if goRight then
                turtle.turnLeft()
            else
                turtle.turnRight()
            end
            t, res = turtle.inspect()
        end
        turtle.place()
        buckets = buckets + 1
        if buckets == 16 then
            turtle.refuel()
        end
        if buckets == 17 then
            if goRight then
                turtle.turnRight()
            else
                turtle.turnLeft()
            end
            returnHome(path, path_index, turnRight)
            return
        end
        turtle.forward()
        if goRight then
            turtle.turnRight()
        else
            turtle.turnLeft()
        end
        path_index = path_index+1
        path[path_index] = 0
        goRight = not goRight
    else
        path[path_index] = path[path_index]+1
    end
    t, res = turtle.inspect()
end
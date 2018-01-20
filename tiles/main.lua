function love.load()
    j = 1;
    v = 1;
    image = love.graphics.newImage("tileset.png")

    local image_width = image:getWidth()
    local image_height = image:getHeight()
    width = (image_width / 3) - 2
    height = (image_height / 2) - 2

    quads = {}

    for i=0,1 do
        for i=0,2 do
            table.insert(quads,
                love.graphics.newQuad(
                    1 + j * (width + 2),
                    1 + i * (height + 2),
                    width, height,
                    image_width, image_height))
        end
    end

    tilemap = {
        {1, 6, 6, 2, 1, 6, 6, 2},
        {3, 0, 0, 4, 5, 0, 0, 3},
        {3, 0, 0, 0, 0, 0, 0, 3},
        {4, 2, 0, 0, 0, 0, 1, 5},
        {1, 5, 0, 0, 0, 0, 4, 2},
        {3, 0, 0, 0, 0, 0, 0, 3},
        {3, 0, 0, 1, 2, 0, 0, 3},
        {4, 6, 6, 5, 4, 6, 6, 5}
    }

    --Create our player
    player = {
        image = love.graphics.newImage("player.png"),
        tile_x = 2,
        tile_y = 2
    }
end

function love.draw()
    for i,row in ipairs(tilemap) do
        for j,tile in ipairs(row) do
            if tile ~= 0 then
                --Draw the image with the correct quad
                love.graphics.draw(image, quads[v], j * width, i * height)
            end 
        end
    end

    --Draw the player and multiple its tile position with the tile width and height
    love.graphics.draw(player.image, player.tile_x * width, player.tile_y * height)
end

function love.keypressed(key)
    local x = player.tile_x
    local y = player.tile_y
    if key == "left" then
        if isEmpty(x - 1, y) then
            player.tile_x = x - 1
        end
    elseif key == "right" then
        if isEmpty(x + 1, y) then
            player.tile_x = x + 1
        end
    elseif key == "up" then
        if isEmpty(x, y - 1) then
            player.tile_y = y - 1
        end
    elseif key == "down" then
        if isEmpty(x, y + 1) then
            player.tile_y = y + 1
        end
    end
end

function isEmpty(x, y)
    return tilemap[y][x] == 0
end

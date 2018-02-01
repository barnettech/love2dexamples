function love.load()

  img = love.graphics.newImage("flappy4MedalsSprite.jpeg")
 
  -- Let's say we want to display only the top-left 
  -- 32x32 quadrant of the Image:
  top_left = love.graphics.newQuad(0, 0, 75, 75, img:getDimensions())
 
  -- And here is bottom left:
  bottom_left = love.graphics.newQuad(0, 75, 75, 75, img:getDimensions())

  -- top right
  top_right = love.graphics.newQuad(75, 0, 75, 75, img:getDimensions())

  -- bottom right
  bottom_right = love.graphics.newQuad(75, 75, 75, 75, img:getDimensions())


end
 
function love.draw()
	love.graphics.draw(img, top_left, 50, 50)
	love.graphics.draw(img, bottom_left, 50, 200)
        love.graphics.draw(img, top_right, 200, 50)
        love.graphics.draw(img, bottom_right, 200, 200)


	-- v0.8:
	-- love.graphics.drawq(img, top_left, 50, 50)
	-- love.graphics.drawq(img, bottom_left, 50, 200)
end

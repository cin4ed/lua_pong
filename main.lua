require("player")
require("computer")
require("ball")

function love.load()
	Player:load()
	Computer:load()
	Ball:load()
end

function love.update(dt)
	Player:update(dt)
	Computer:update(dt, Ball)
	Ball:update(dt, {Player, Computer})
end

function love.draw()
	Player:draw()
	Computer:draw()
	Ball:draw()
end

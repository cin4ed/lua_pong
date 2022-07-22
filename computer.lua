
Computer = {}

function Computer:load()
	self.x = love.graphics.getWidth() - (50 + 20)
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 60
	self.speed = 550
end

function Computer:update(dt, ball)
	self:move(dt, ball)
	self:checkBoundaries()
end

function Computer:move(dt, ball)
	self.y = ball.y - self.height / 2
end

function Computer:checkBoundaries()
	if self.y < 0 then
		self.y = 0
	elseif self.y + self.height > love.graphics.getHeight() then
		self.y = love.graphics.getHeight() - self.height
	end
end

function Computer:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

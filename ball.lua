
Ball = {}

function Ball:load()
	local speed = 400
	self.x = love.graphics.getWidth() / 2
	self.y = love.graphics.getHeight() / 2
	self.width = 20
	self.height = 20
	self.xSpeed = speed
	self.ySpeed = speed
	self.coll = "both"
end

function Ball:update(dt, player)
	self:move(dt)
	self:checkCollisions(player)
end

function Ball:move(dt)
	self.x = self.x + self.xSpeed * dt
	self.y = self.y + self.ySpeed * dt
end

function Ball:checkCollisions(rects)
	-- Collision with top and bottom wall
	if self.y < 0 or self.y + self.height > love.graphics.getHeight() then
		self.ySpeed = self.ySpeed * -1
	end

	if self.coll == "both" then
		-- With both walls (left and right)
		if self.x < 0 or self.x + self.width > love.graphics.getWidth() then
			self.xSpeed = self.xSpeed * -1
		end
	elseif self.coll == "right" then
		-- With right wall only
		if self.x + self.width > love.graphics.getWidth() then
			self.xSpeed = self.xSpeed * -1
		end
	elseif self.coll == "left" then
		-- With left wall only
		if self.x < 0 then
			self.xSpeed = self.xSpeed * -1
		end
	end

	-- Collisions with rectangles
	if self.x < love.graphics.getWidth()/5 or self.x > love.graphics.getWidth()/5 * 4 then
		for i = 1, #rects do
			-- Left one
			if self.x + self.width > rects[i].x and 
				self.x < rects[i].x + rects[i].width and
				self.y + self.height > rects[i].y and
				self.y < rects[i].y + rects[i].height then
				self.xSpeed = self.xSpeed * -1
			end
		end
	end
end

function Ball:draw()
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end

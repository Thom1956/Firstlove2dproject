require ("update")
require ("draw")
require ("load")
require ("gameplay")
require ("tools")



sti = require "sti"

function love.load()
 GraphicsLoad()
  map=sti("gfx/rpgtiles.lua")
  local layer= map:addCustomLayer("sprites",8)
  
  -- Get player spawn object
	local player
	for k, object in pairs(map.objects) do
		if object.name == "Player" then
			player = object
			break
		end
	end
  
  local sprite = love.graphics.newImage("gfx/fantasytiles.png")
	layer.player = {
		sprite = sprite,
		x      = player.x,
		y      = player.y,
		ox     = sprite:getWidth() / 2,
		oy     = sprite:getHeight() / 1.35
	}
  
  layer.draw = function(self)
		love.graphics.draw(
			self.player.sprite,
			math.floor(self.player.x),
			math.floor(self.player.y),
			0,
			1,
			1,
			self.player.ox,
			self.player.oy
		)

		-- Temporarily draw a point at our location so we know
		-- that our sprite is offset properly
		love.graphics.setPointSize(5)
		love.graphics.points(math.floor(self.player.x), math.floor(self.player.y))
	end
  
end


function love.update()
  update_game()
  map:update(dt)
end


function love.draw()
  --Draw_Game()
   local sw,sh= love.graphics.getDimensions()
  local mw,mh= map.canvas:getDimensions()
  map:draw(nil,nil, sw/mw, sh/mh)
  --love.graphics.draw(Map.canvas,0,0)
end


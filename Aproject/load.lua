--graphics


function GraphicsLoad()
  love.graphics.setDefaultFilter('nearest','nearest')
  TileSet = love.graphics.newImage("gfx/fantasytiles.png")
  local tilew=8
  local tileh=8
   tilesetw, tileseth= TileSet:getWidth(), TileSet:getHeight()
  GrassQuad= love.graphics.newQuad(24,8,tilew,tileh,TileSet:getDimensions()
  
end
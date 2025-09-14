panel = window -- my w key is dodgy so I ould like to minimize the number of times I need to rely on it
serl = textutils.serializeJSON
Sprite = require("lib/sprite")
SlideBase, Element, Transition = require("lib/slideDataStruct")
scrn = peripheral.wrap("monitor_1")

function test_a()
  screen.setCursorPos(2,2)
  screen.setTextColor(0)
  screen.setBackgroundColor(2^15)
  screen.clear()
  screen.write("test")
end

function blitSprite(self, sprite, spriteX, spriteY)
  for i = 1, sprite.height do
    self.setCursorPos(spriteX, spriteY + i)
	--print(sprite:getBlits(i))
	self.blit(sprite:getBlits(i))
  end
end

function test_b()
  -- default slide size (40, 16)
  -- intervals of (10x, 4x)
  -- 
  scrn.setBackgroundColor(2^15)
  
  scrn.clear()
  
  testPlane_a = Sprite:new(32, 12, 0, 15)

end
test_b()
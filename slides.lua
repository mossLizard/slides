panel = window -- my w key is dodgy so I ould like to minimize the number of times I need to rely on it
serl = textutils.serializeJSON
plane = require("lib/charPlane")
scrn = peripheral.wrap("monitor_1")

function test_a()
  screen.setCursorPos(2,2)
  screen.setTextColor(0)
  screen.setBackgroundColor(2^15)
  screen.clear()
  screen.write("test")
end

function blitSprite(self, sprite, spriteX, spriteY)
  for i = 1, sprite.width do
    self.setCursorPos(spriteX, spriteY + i)
	--print(sprite:getBlits(i))
	self.blit(sprite:getBlits(i))
  end
end

function test_b()
  slideBase = panel.create(scrn,1,1,40,16,false) -- 1:1
  -- default slide size (40, 16)
  -- intervals of (10x, 4x)
  -- 
  scrn.setBackgroundColor(2^15)
  scrn.clear()
  slideBase.setBackgroundColor(2^14)
  slideBase.clear()
  slideBase.setVisible(true)
  --
  scrn.clear()
  slideBase.redraw()
  print("E")
  
  testPlane_a = plane:new(8,16, 0, 15)
  testPlane_b = plane:new(12,12, 3, 2)
  testPlane_a:test_set("beep")
  testPlane_b:test_set("boop")
  print(testPlane_a:test_get())
  print(testPlane_b:test_get())
  blitSprite(scrn, testPlane_a, 2, 3)
  blitSprite(scrn, testPlane_b, 12, 13)
  testPlane_a:fillAll({"/","-","\\","|",nil,"|","\\","-","/"},12,0)
  testPlane_a:write("Behold! my TRUE form!",1,1,6)
  blitSprite(scrn, testPlane_a, 2, 13)

end
test_b()
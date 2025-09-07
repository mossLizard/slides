panel = window -- my w key is dodgy so I ould like to minimize the number of times I need to rely on it
plane = require("lib/charPlane")
scrn = peripheral.wrap("monitor_1")

function test_a()
  scrn.setCursorPos(2,2)
  scrn.setTextColor(0)
  scrn.setBackgroundColor(2^15)
  scrn.clear()
  scrn.write("test")
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
  
  testPlane_a = plane.new(8,16)
  testPlane_b = plane.new(12,12)
  testPlane_a.test_set("beep")
  testPlane_b.test_set("boop")
  print(testPlane_a.test_get())
  print(testPlane_b.test_get())

end
test_b()
-- creates a set of 2 color and 1 character plane that can be written to and read from
-- this set is called a Sprite
-- uses 0-f for colors for easy blitting

chr = string.char

charPlane = {}


  function charPlane.numOrCharToColor(inpt, fallback)
    -- not making a backup case for fallback to encourage me to define one every time
    -- leave fallback nil if you want an error
    local tmp = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
    inpt = inpt or fallback
    if type(inpt) == 'number' then
      if inpt >= 0 and inpt <= 15 then
        return tmp[inpt+1]
      end
    elseif type(inpt) == 'string' and #inpt == 1 then
      for i,v in ipairs(tmp) do
        if v == inpt then return inpt end
      end
    end
    if fallback == nil then
      error("Input '".. tostring(inpt).."' could not be converted to a color, and no fallback color was set!")
    end
    return fallback
  end
  
  function charPlane:setLine(lineNumber, valsChar, valsTx, valsBg)
    self.chars[lineNumber] = valsChar
    self.colorsTx[lineNumber] = valsTx
    self.colorsBg[lineNumber] = valsBg
  end

  function charPlane:getBlits(lineNumber)
    -- returns the character, txt color, and bg color planes as three lists of blit-rows
    -- if lineNumber is defined, it will only return the corresponding blit-row of each
    if lineNumber ~= nil then
      return self.chars[lineNumber], self.colorsTx[lineNumber], self.colorsBg[lineNumber]
    end
    return self.chars, self.colorsTx, self.colorsBg
  end

  function charPlane:getSection(startingX, startingY, sizeX, sizeY)
    -- returns a section of the character, txt color, and bg color planes as lists of blit-rows
    for i=startingY, (startingY+sizeY) do
      planes_i = math.max(math.min(#self.chars),1)
    end
  end
  
  function charPlane.overwriteAt(inpt, repl, index)
    local sto = inpt:sub(1,index) .. repl .. inpt:sub(index + #repl+1, -1)
	sto = sto:sub(1,#inpt)
	return sto
  end
  
  function charPlane:write(vals, x, y, width)
    -- x and y are zero indexed. Or one indexed if you don't count the borders
	-- pass a list of strings to vals to write each item on a new line
	-- pass a number to width to automatically wrap after that many characters
	if type(vals) == "string" then
	  if width == nil then
	    self.chars[y+1] = charPlane.overwriteAt(self.chars[y+1], vals, x)
	  else
		for i = 1, math.ceil(#vals / width) do
	      self.chars[y+i] = charPlane.overwriteAt(self.chars[y+i], vals:sub((i-1)*width,i*width - 1), x)
		end
	  end
	end
	
  end
  
  function charPlane.borderHelper(orig, bdr, i)
    if type(bdr) == "number" then
	  bdr = charPlane.numOrCharToColor(bdr)
	  bdr = {bdr, bdr, bdr,
	         bdr, bdr, bdr,
			 bdr, bdr, bdr}
	end
	local lcr = {bdr[4], bdr[5], bdr[6]}
	if i == 1 then
	  lcr = {bdr[1], bdr[2], bdr[3]}
	elseif i == #orig then
	  lcr = {bdr[7], bdr[8], bdr[9]}
	end
	local sto = orig or ""
	if lcr[1] ~= nil then
	  sto = lcr[1]..sto:sub(2,-1)
	end
	if lcr[2] ~= nil then
	  sto = sto:sub(1, 1) .. lcr[2]:rep(#orig-2) .. sto:sub(-1,-1)
	end
	if lcr[3] ~= nil then
	  sto = sto:sub(1,-2)..lcr[3]
	end
	return sto
  end
  
  function charPlane:fillAll(cha, tx, bg)
    if (cha == nil or type(cha) == 'string') and 
	(tx == nil or type(tx) == 'number' or type(tx) == 'string') and 
	(bg == nil or type(bg) == 'number' or type(bg) == 'string') then
	cha = cha or chr(32)
	tx = tx or '0'
	bg = bg or 'f'
      for i = 1, self.height do
	    self.chars[i] = cha:rep(self.width)
	    self.colorsTx[i] = charPlane.numOrCharToColor(tx, '0'):rep(self.width)
	    self.colorsBg[i] = charPlane.numOrCharToColor(bg, 'f'):rep(self.width)
	  end
	else
      for i=1, self.height do
	    self.chars[i] = charPlane.borderHelper(self.chars[i],cha,i)
	    self.colorsTx[i] = charPlane.borderHelper(self.colorsTx[i],tx,i)
	    self.colorsBg[i] = charPlane.borderHelper(self.colorsBg[i],bg,i)
	  end
	end
  end
  
  function charPlane:test_set(a)
    self.test_val = a
  end
  function charPlane:test_get()
    return self.test_val
  end

  function charPlane.new(self, width, height, tx, bg)
  -- Creates a new sprite object of the desired size, filled with character 32, of color tx on bg
  -- colors default to 0 on F and the bg character is 0x20
    o = {} -- sometimes this doesn't work inside of the function
    setmetatable(o, self)
    self.__index = self
	o.chars = {}
	o.colorsTx = {}
	o.colorsBg = {}
	o.width = width
	o.height = height
	o:fillAll(chr(32), tx, bg)
    --defTxtColor = charPlane.numOrCharToColor(defTxtColor, '0')
    return o
  end
  
  
return charPlane
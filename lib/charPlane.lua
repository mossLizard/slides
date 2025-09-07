-- creates a set of 2 color and 1 character plane that can be written to and read from
-- this set is called a Sprite
-- uses 0-f for colors for easy blitting

charPlane = {}
  charPlane.chars = {}
  charPlane.colorTx = {}
  charPlane.colorBg = {}
  function charPlane.numOrCharToColor(inpt, fallback)
    -- not making a backup case for fallback to encourage me to define one every time
    -- leave fallback nil if you want an error
    local tmp = {'0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f'}
    inpt = inpt or fallback
    if type(inpt) == 'number' then
      if inpt >= 0 and inpt <= 15 then
        return tmp[inpt]
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

  function charPlane.getBlits(lineNumber)
    -- returns the character, txt color, and bg color planes as three lists of blit-rows
    -- if lineNumber is defined, it will only return the corresponding blit-row of each
    if lineNumber ~= nil then
      return charPlane.chars[lineNumber], charPlane.colorTx[lineNumber], charPlane.colorBg[lineNumber]
    end
    return charPlane.chars, charPlane.colorTx, charPlane.colorBg
  end

  function charPlane.getSection(startingX, startingY, sizeX, sizeY)
    -- returns a section of the character, txt color, and bg color planes as lists of blit-rows
    for i=startingY, (startingY+sizeY) do
      planes_i = math.max(math.min(#charPlane.chars),1)
    end
  end

  function charPlane.test_set(a)
    charPlane.test_val = a
  end
  function charPlane.test_get()
    return charPlane.test_val
  end

  function charPlane.new(height, width, defTxtColor, defBgColor)
  -- use this to create a new Plane object!
  -- the library has all the functions but not the properties.
  -- colors default to 0 on F and the plane is filled with char 127
    defTxtColor = charPlane.numOrCharToColor(defTxtColor, '0')
    defBgColor  = charPlane.numOrCharToColor(defBgColor, 'f')
    local colorBg = {}
    local colorTx = {}
    local chars = {}
    for i=1, height do
      colorBg[i] = string.rep(defBgColor, width)
      colorTx[i] = string.rep(defTxtColor, width)
      chars[i] = string.rep(string.char(127),width)
    end
    newPlane = {
      ['colorBg'] = colorBg,
      ['colorTx'] = colorTx,
      ['chars']   = chars,
      ['test_set'] = charPlane.test_set,
      ['test_get'] = charPlane.test_get,
    }
    return newPlane
  end
  
  
return charPlane
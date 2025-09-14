
-- ELEMENT CLASS
ElementClass = {}
  function ElementClass.new(self, elementType, elementName)
    -- elementType: type of element. usually textBox or colorBox
	-- elementName: name of the element. the names "title" and "body_*" are special for slide layout reasons.
	if elementType == nil then
	  error("No elementType passed when creating new Element!")
	end
	if elementType == nil then
	  error("No elementName passed when creating new Element!")
	end
	o = {}
    setmetatable(o, self)
    self.__index = self
	o.elementType = elementType
	o.elementName = elementName
	o.overrides = {["isPreset"] = false}
	initFunction = ElementClass.typeRouter(elementType, "init")
	initFunction(o, elementName)
	return o
  end
  
  function ElementClass:initTextBox(elementName)
    if elementName == nil then
	  error("Text box cannot have a nil elementName!")
	end
	self.overrides["content"] = "Hello, My Name Is "..elementName
	
	if elementName == "title" then
	  self.overrides["content"] = " SLIDE TITLE "
	  self.overrides["borderType"] = 2
	  self.overrides["textAlignment"] = "center"
	elseif elementName:sub(1,4) == "body" then
	  self.overrides["content"] = "Select me and press E to edit my text!"
    end
  end
  
  function ElementClass.typeRouter(elementType, functionType)
    if elementType == nil then
	  error("elementType Router called with nil input!")
	elseif elementType == "textBox" then
	  if functionType == "init" then
	    return ElementClass.initTextBox
	  end
	  return true
	elseif elementType == "image" then
	  if functionType == "init" then
	    return ElementClass.initTextBox
	  end
	  return true
	else
	  error("Invalid elementType '".. elementType .."' passed to elementType router!")
	end
  end
  
  function ElementClass.initTextBox(name)
  
  end
  
  function ElementClass:listOverrides(onlyKeys)
    -- returns a dictionary pairing all currently set overrides to their values
	-- Pass true to onlyKeys to return a list of present overrides without values
  end
  
  function ElementClass:getOverride(overType, default)
    -- reads from this element's override table
	--   If the override is present, returns the override value and true
	--   Otherwise, returns the default value and false
  end
  
  function ElementClass:clearOverride(overType)
    -- Removes the specified override from this element. Returns true if successful.
	-- If override was not present, returns false.
  end


-- SLIDE BASE CLASS
SlideBaseClass = {}
  function SlideBaseClass.new(self)
  
  end
  
  function SlideBaseClass:getElements()
  
  end
  function SlideBaseClass:addElement(newElement)
  
  end
  function SlideBaseClass:removeElement(trgt)
    -- pass hierarchy index or element name
  
  end
  function SlideBaseClass:render(returnType, renderMode, depth, color)
    -- Compiles the blits of all elements on the slide base into a single screen-sized sprite. Returns this sprite, or its data, as indicated by the settings.
	-- Each parameter 
	--   returnType:
	--     blit - default. return a list of character, txcolor, and bgcolor blits
	--     sprite - return the slide as a sprite
	--     layer  - return single blits that represent the layer of the topmost element on each character. Pass something to depth to return a value relative to the target depth
	--   render modes:
	--     all - default. All elements are rendered
	--     below - Only render elements at or below depth
	--     isolate - Only render element AT depth
	--   color:
	--     color - default. 4-bit color graphics mode. Colors taken from element color data.
	--     false - 2-bit greyscale mode. Slide is white. Elements are black on light grey, element at depth is white on dark grey.
  end



--TRANSITION CLASS
TransitionClass = {}
  function TransitionClass.new(self)
    
  end
  
  function TransitionClass.router(name)
    if name == nil then
	  error("Transition router called with nil input!")
	end
	error("Unknown transition name '".. name .."' passed to transition router!")
  end
  function TransitionClass:applyProgress(baseSprite, overSprite, progress)
    -- Replaces data in baseSprite with data from overSprite, according to the selected transition settings and the given progress. Returns the modified baseSprite.
	-- baseSprite and overSprite are Sprites
	-- progress should be passed as the number of ticks since the transition began.
  end
  function TransitionClass:setType(newType)
    self.transitionType = newType
    
  end

return SlideBaseClass, ElementClass, TransitionClass
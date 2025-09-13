
-- ELEMENT CLASS
ElementClass = {}
  function ElementClass.new(self, elementType)
  
  end
  
  function ElementClass:listOverrides(onlyKeys)
    -- returns a dictionary pairing all currently set overrides to their values
	-- Pass true to onlyKeys to return a list of overrides without values
  end
  
  function ElementClass:getOverride(overType)
    -- returns the value of the override in overType
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
  function TransitionClass.router(name)
    if name == nil then
	  error("Transition router called with nil input!")
    elseif type(name) ~= string then
	  error("Non-string value ("..type(name)..") passed to transition router!")
	end
	error("Invalid transition name '".. name) .."' passed to transition router!")
  end
  function TransitionClass.new(self)
    
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
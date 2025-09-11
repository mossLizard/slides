elementClass = {}
slideBaseClass = {}
transitionClass = {}

--TRANSITION
  function transitionClass.router(name)
    if name == nil then
	  error("Transition router called with nil input!")
    elseif type(name) ~= string then
	  error("Non-string value ("..type(name)..") passed to transition router!")
	end
	error("Invalid transition name '".. name) .."' passed to transition router!")
  end
  function transitionClass.new(self)
    
  end
  function transitionClass:applyProgress(baseSprite, overSprite, progress)
    -- Replaces data in baseSprite with data from overSprite, according to the selected transition settings and the given progress. Returns the modified baseSprite.
	-- baseSprite and overSprite are Sprites
	-- progress should be passed as the number of ticks since the transition began.
  end
  function transitionClass:setType(newType)
    self.transitionType = newType
    
  end

return slideBaseClass, elementClass, transitionClass
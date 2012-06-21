
Bragi.ComponentType = {}


#Class giving ids to a component
class ComponentType

  #Those ids are used to identify the component type and retrieve the actual component
  _nextId = 0
  _nextBit = 1

  constructor: () ->
    @id = _nextId
    _nextId++
    
    #Much faster than ++
    @bit = _nextBit
    _nextBit = _nextBit << 1


Bragi.ComponentType = ComponentType
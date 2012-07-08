
Artemis.Entity = {}


class Entity

  constructor: (world, id) ->
    @world = world
    @id = id

    #components
    @typeBits = 0
    #systems
    @systemBits = 0


  #Deletes itself using the EntityWorld
  delete: () ->
    @world.deleteEntity @


  #Call that function directly to add any component to an entity
  addComponent: (component) ->
    unless component instanceof Artemis.Component
      throw new Error "Tried to add a component that is not inheriting from Component"

    @world.entityManager._addComponent @, component
    null


  #Call the entity manager to delete this component from this entity
  removeComponent: (componentName) ->
    @world.entityManager._removeComponent @, componentName
    null


  #Call the entity manager and returns the component requested
  getComponent: (componentName) ->
    @world.entityManager._getComponent @, componentName


  refresh: () ->
    @world.refreshEntity @


  #Using bitwise operations as it is very very fast
  _addTypeBit: (bit) ->
    @typeBits |= bit


  #Using bitwise operations as it is very very fast
  _removeTypeBit: (bit) ->
    @typeBits &= ~bit


  #Using bitwise operations as it is very very fast
  _addSystemBit: (bit) ->
    @systemBits |= bit


  #Using bitwise operations as it is very very fast
  _removeSystemBit: (bit) ->
    @systemBits &= ~bit


  #returns if the entity has been deleted or not
  isActive: () ->
    @world.entityManager._isActive @id


  #Shortcut to add the entity to a group
  setGroup: (group) ->
    @world.groupManager.set group, @

  #Shortcut to add the entity to a group
  setTag: (tag) ->
    @world.tagManager.register tag, @

  #for debug
  getComponents: () ->
    #returns all the components that this entity has






Artemis.Entity = Entity
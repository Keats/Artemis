
Bragi.Entity = {}


class Entity

  constructor: (world, id) ->
    @world = world
    @id = id

    @bits = 0


  #Deletes itself using the EntityWorld
  delete: () ->
    @world.deleteEntity @


  #Call that function directly to add any component to an entity
  addComponent: (component) ->
    unless component instanceof Bragi.Component
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



  #Using bitwise operations as it is very very fast
  _addBit: (bit) ->
    @bits |= bit


  #Using bitwise operations as it is very very fast
  _removeBit: (bit) ->
    @bits &= ~bit


  #returns if the entity has been deleted or not
  isActive: () ->
    @world.entityManager._isActive @id




  #for debug
  getComponents: () ->
    #returns all the components that this entity has






Bragi.Entity = Entity

Bragi.Entity = {}


class Entity

  constructor: (world, id) ->
    @world = world
    @id = id

    @bits = 0


  #Call that function directly to add any component to an entity
  addComponent: (component) ->
    unless component instanceof Bragi.Component
      throw new Error "Tried to add a component that is not inheriting from Component"

    @world.entityManager._addComponent @, component
    null


  #Using bitwise operations as it is very very fast
  _addBit: (bit) ->
    @bits |= bit


  #Using bitwise operations as it is very very fast
  _removeBit: (bit) ->
    @bits &= ~bit


  removeComponent: (component) ->
    #remove it from something


  getComponents: () ->
    #returns all the components that this entity has


  isActive: () ->
    #returns if the entity has been deleted or not


  delete: () ->
    #delete this entity


Bragi.Entity = Entity
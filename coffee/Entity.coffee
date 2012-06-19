
Bragi.Entity = {}


class Entity

  constructor: (world, id) ->
    @world = world
    @id = id

    @components = []


  addComponent: (component) ->
    #add it to something


  removeComponent: (component) ->
    #remove it from something


  getComponents: () ->
    #returns all the components that this entity has


  isActive: () ->
    #returns if the entity has been deleted or not


  delete: () ->
    #delete this entity


Bragi.Entity = Entity

Bragi.ComponentMapper = {}


#Class containing a mapping between all components and entities
class ComponentMapper


  constructor: (componentClass, world) ->
    @world = world
    @em = world.entityManager
    @componentClass = componentClass


  get: (entity) ->
    #gets the component for the entity



Bragi.ComponentMapper = ComponentMapper
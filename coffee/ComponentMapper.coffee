
Bragi.ComponentMapper = {}


#Class containing a mapping between all components and entities
class ComponentMapper


  constructor: (componentName, world) ->
    @world = world
    @em = world.entityManager
    @componentName = componentName


  #gets the component for the entity
  get: (entity) ->
    @em._getComponent entity, @componentName



Bragi.ComponentMapper = ComponentMapper
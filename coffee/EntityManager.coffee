
Bragi.EntityManager = {}


#Handles all the entities
class EntityManager


  constructor: (world) ->
    @world = world
    @entities = {}
    @nextId = 0


  create: () ->
    entity = new Bragi.Entity @world, @nextId

    @nextId++
    @entities[entity.id] = entity

    entity


  remove: (entity) ->
    delete @entities[entity.id]

    #Now we should remove the components of the entity


  addComponent: (entity, component) ->
    #add a component to an entity
    #should automatically create a mapping between 


  getComponent: (entity, component) ->
    #returns a component based on entity/component combinaison

  
  removeComponent: (entity, component) ->
    #removes a component from an entity


  removeAllComponents: (entity) ->
    #removes all components from an entity, called when deleting an entity


  getEntity: (id) ->
    #returns the entity based on the id


  isActive: (id) ->
    #checks if the entity still exists or not


Bragi.EntityManager = EntityManager
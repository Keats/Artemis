
Bragi.EntityManager = {}


#Handles all the entities
class EntityManager


  constructor: (world) ->
    @world = world

    @entities = {}
    @componentsByType = {}
    @nextId = 0


  #Register an entity in the entity manager, called by World.createEntity
  _create: () ->
    entity = new Bragi.Entity @world, @nextId

    @nextId++
    @entities[entity.id] = entity

    entity


  #Get an entity in the entity manager, called by World.getEntity
  _getEntity: (id) ->
    @entities[id]


  remove: (entity) ->
    delete @entities[entity.id]

    #Now we should remove the components of the entity


  #Adds a component to an entity and maps them for quick retrieval
  _addComponent: (entity, component) ->
    unless component instanceof Bragi.Component
      throw new Error "Tried to add a component that is not inheriting from Component"

    componentType = Bragi.ComponentTypeManager.getType(component)

    #Checking if we already have this type in our object
    components = @componentsByType[componentType.id]

    if not components
      components = {}
      @componentsByType[componentType.id] = components

    #We add the entity in the component object
    #All the entities for this component will be referencered there, with the actual component object
    components[entity.id] = component

    #Adding a reference to this component in the entity as bits (fast)
    entity._addBit componentType.bit


  getComponent: (entity, component) ->
    #returns a component based on entity/component combinaison

  
  removeComponent: (entity, component) ->
    #removes a component from an entity


  removeAllComponents: (entity) ->
    #removes all components from an entity, called when deleting an entity




  isActive: (id) ->
    #checks if the entity still exists or not


Bragi.EntityManager = EntityManager
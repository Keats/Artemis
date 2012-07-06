
Bragi.EntityManager = {}


#Handles all the entities
class EntityManager


  constructor: (world) ->
    @world = world

    @entities = {}
    @componentsByType = {}
    @nextId = 0

    #Number of active entities
    @count = 0
    #Number of entities created
    @totalCreated = 0


  #Register an entity in the entity manager, called by World.createEntity
  _create: () ->
    entity = new Bragi.Entity @world, @nextId

    @nextId++
    @entities[entity.id] = entity

    @count++
    @totalCreated++

    entity


  #Get an entity in the entity manager, called by World.getEntity
  _getEntity: (id) ->
    @entities[id]


  remove: (entity) ->
    #We remove the entity from the list of entities
    delete @entities[entity.id]

    #Now we should remove the components of the entity
    @_removeAllComponents entity

    @count--

    #And we delete the entity itself
    entity = null


  #checks if the entity has been deleted or not
  _isActive: (id) ->
    if @entities[id]
      true
    else
      false


  #Adds a component to an entity and maps them for quick retrieval
  _addComponent: (entity, component) ->
    componentType = Bragi.ComponentTypeManager.getType component

    #Checking if we already have this type in our object
    components = @componentsByType[componentType.id]

    if not components
      components = {}
      @componentsByType[componentType.id] = components

    #We add the entity in the component object
    #All the entities for this component will be referencered there, with the actual component object
    components[entity.id] = component

    #Adding a reference to this component in the entity as bits (fast)
    entity._addTypeBit componentType.bit


  #removes a component from an entity
  _removeComponent: (entity, componentName) ->
    componentType = Bragi.ComponentTypeManager.getTypeByName componentName
    #We get back the part of the array containing this component type
    components = @componentsByType[componentType.id]
    #We delete the one corresponding to this entity
    delete components[entity.id]
    #And we finally remove the bits in the entity
    entity._removeTypeBit componentType.bit


  #returns a component based on entity/component combinaison
  _getComponent: (entity, componentName) ->
    componentType = Bragi.ComponentTypeManager.getTypeByName componentName
    components = @componentsByType[componentType.id]

    if components 
      components[entity.id]
    else
      null
      

  #returns all components for a given entity
  #for debug
  _getAllComponents: (entity) ->
    allComponents = []
    
    for index, components of @componentsByType
      if components
        component = components[entity.id]
        if component
          allComponents.push component

    allComponents



  #removes all components from an entity, called when deleting an entity
  _removeAllComponents: (entity) ->
    for index, componentTypes of @componentsByType
      if entity.id of componentTypes
        delete componentTypes[entity.id]

        #Small check to avoid leaving an empty object
        if Object.keys(componentTypes).length is 0
          delete @componentsByType[index]



Bragi.EntityManager = EntityManager
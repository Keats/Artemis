
Bragi.EntityWorld = {}


#Main class that instantiates the managers
#Main interface to the framework, entities are created from here
class EntityWorld


  constructor: () ->
    @entityManager = new Bragi.EntityManager @
    @systemManager = new Bragi.SystemManager @
    @tagManager = new Bragi.TagManager @
    @groupManager = new Bragi.GroupManager @

    @deleted = []
    @refreshed = []

    @delta = 0


  #Creates an entity and do all the background tasks
  createEntity: () ->
    @entityManager._create()


  #Retrieves an entity by its id
  getEntity: (id) ->
    @entityManager._getEntity(id)


  #Adds an entity to delete in the deleted array
  deleteEntity: (entity) ->
    if entity not in @deleted
      @deleted.push entity


  #Mark an entity as needing to refresh
  refreshEntity: (entity) ->
    @refreshed.push entity


  #Main loop of the framework
  loopStart: () ->
    for entity in @refreshed
      @entityManager.refresh entity
    @refreshed = []
    
    for entity in @deleted
      @entityManager.remove entity
    @deleted = []


Bragi.EntityWorld = EntityWorld
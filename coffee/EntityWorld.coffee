
Bragi.EntityWorld = {}


#Main class that instantiates the managers
#Main interface to the framework, entities are created from here
class EntityWorld


  constructor: () ->
    @entityManager = new Bragi.EntityManager @
    @systemManager = new Bragi.SystemManager @
    @tagManager = new Bragi.TagManager @

    @deleted = []


  #Creates an entity and do all the background tasks
  createEntity: () ->
    @entityManager._create()


  #Retrieves an entity by its id
  getEntity: (id) ->
    @entityManager._getEntity(id)


  deleteEntity: (entity) ->
    #should delete an entity (add it to an array of deleted to process next)




  getEntityByTag: (tag) ->
    #should return the entity by looking at the tag


Bragi.EntityWorld = EntityWorld
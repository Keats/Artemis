
Bragi.World = {}


#Main class that instantiates the managers
class World


  constructor: () ->
    @entityManager = new Bragi.EntityManager @
    @systemManager = new Bragi.SystemManager @
    @tagManager = new Bragi.TagManager @

    @deleted = []


  createEntity: () ->
    @entityManager.create()


  deleteEntity: (entity) ->
    #should delete an entity (add it to an array of deleted to process next)


  getEntity: (id) ->
    #should return the entity with his id


  getEntityByTag: (tag) ->
    #should return the entity by looking at the tag


Bragi.World = World
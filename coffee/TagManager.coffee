
Artemis.TagManager = {}


#Can be used to tag some entities, like the player, for easy retrieval
class TagManager


  constructor: (world) ->
    @world = world
    @taggedEntities = {}


  #add a mapping between a tag and an entity
  register: (tag, entity) ->
    @taggedEntities[tag] = entity
    null


  #Removes the tagging
  unregister: (tag) ->
    delete @taggedEntities[tag]


  #Retrieves an entity easily via its tag
  get: (tag) ->
    @taggedEntities[tag]


  #Find out if a tag is registered or not
  isRegistered: (tag) ->
    tag of @taggedEntities


Artemis.TagManager = TagManager

Bragi.TagManager = {}


#Can be used to tag some entities, like the player, for easy retrieval
class TagManager


  constructor: (world) ->
    @world = world
    @taggedEntities = {}


  add: (tag, entity) ->
    #add to the @taggedEntities dict


  remove: (tag) ->
    #remove from the @taggedEntities dict


  get: (tag) ->
    #returns the entity from the @taggedEntities dict



Bragi.TagManager = TagManager
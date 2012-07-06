
Bragi.GroupManager = {}


class GroupManager

  constructor: (world) ->
    @world = world
    @entitiesByGroup = {}
    @groupByEntity = {}


  #adds an entity to a group
  set: (group, entity) ->
    #1 entity can only be in one group
    @remove entity

    entities = @entitiesByGroup[group]

    if not entities
      entities = []
      @entitiesByGroup[group] = entities

    entities.push entity

    #And we store it in the reverse order
    @groupByEntity[entity.id] = group



  #gets all the entities in a group
  get: (group) ->
    @entitiesByGroup[group]


  #removes an entity from a group
  remove: (entity) ->
    if entity.id of @groupByEntity
      group = @groupByEntity[entity.id]
      delete @groupByEntity[entity.id]

      entities = @entitiesByGroup[group]
      if entities
        index = entities.indexOf entity
        entities.splice index, 1
        #No need to keep empty groups
        if entities.length is 0
          delete @entitiesByGroup[group]



Bragi.GroupManager = GroupManager
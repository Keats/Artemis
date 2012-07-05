
Bragi.EntityProcessingSystem = {}


class EntityProcessingSystem extends Bragi.System

  construct: () ->
    super


  process: (entity) ->
    #TO OVERRIDE

  processEntities: (entities) ->
    for entity in entities
      @process entity



Bragi.EntityProcessingSystem = EntityProcessingSystem
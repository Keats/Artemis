
Bragi.EntityProcessingSystem = {}


class EntityProcessingSystem extends Bragi.System

  construct: () ->
    super


  processEntity: (entity) ->
    #TO OVERRIDE

  processEntities: (entities) ->
    for index, entity of entities
      @processEntity entity



Bragi.EntityProcessingSystem = EntityProcessingSystem
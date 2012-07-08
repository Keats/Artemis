
Artemis.EntityProcessingSystem = {}


class EntityProcessingSystem extends Artemis.System

  construct: () ->
    super


  processEntity: (entity) ->
    #TO OVERRIDE

  processEntities: (entities) ->
    for index, entity of entities
      @processEntity entity



Artemis.EntityProcessingSystem = EntityProcessingSystem
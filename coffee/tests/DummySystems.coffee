
window.ArtemisTests.DummySystemHP = {}
window.ArtemisTests.DummySystemMovement = {}

class DummySystemHP extends Artemis.EntityProcessingSystem

  constructor: () ->
    super "DummyComponentHP"


  initialize: () ->
    #world is added to the system when calling addSystem from system manager
    @dummyComponentHPMapper = new Artemis.ComponentMapper "DummyComponentHP", @world


  processEntity: (entity) ->
    dummyComponentHP = @dummyComponentHPMapper.get entity
    dummyComponentHP.hp = 0


class DummySystemMovement extends Artemis.EntityProcessingSystem

  constructor: () ->
    super "DummyComponentPosition", "DummyComponentVelocity"


  initialize: () ->
    #world is added to the system when calling addSystem from system manager
    @dummyComponentPositionMapper = new Artemis.ComponentMapper "DummyComponentPosition", @world
    @dummyComponentVelocityMapper = new Artemis.ComponentMapper "DummyComponentVelocity", @world


  processEntity: (entity) ->
    velocity = @dummyComponentVelocityMapper.get entity
    position = @dummyComponentPositionMapper.get entity

    #Just a bogus change
    position.x += velocity.velocity



window.ArtemisTests.DummySystemHP = DummySystemHP
window.ArtemisTests.DummySystemMovement = DummySystemMovement
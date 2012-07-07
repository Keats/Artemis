
window.BragiTests.DummySystemHP = {}
window.BragiTests.DummySystemMovement = {}

class DummySystemHP extends Bragi.EntityProcessingSystem

  constructor: () ->
    super "DummyComponentHP"


  initialize: () ->
    #world is added to the system when calling addSystem from system manager
    @dummyComponentHPMapper = new Bragi.ComponentMapper "DummyComponentHP", @world


  processEntity: (entity) ->
    dummyComponentHP = @dummyComponentHPMapper.get entity
    dummyComponentHP.hp = 0


class DummySystemMovement extends Bragi.EntityProcessingSystem

  constructor: () ->
    super "DummyComponentPosition", "DummyComponentVelocity"


  initialize: () ->
    #world is added to the system when calling addSystem from system manager
    @dummyComponentPositionMapper = new Bragi.ComponentMapper "DummyComponentPosition", @world
    @dummyComponentVelocityMapper = new Bragi.ComponentMapper "DummyComponentVelocity", @world


  processEntity: (entity) ->
    velocity = @dummyComponentVelocityMapper.get entity
    position = @dummyComponentPositionMapper.get entity

    #Just a bogus change
    position.x += velocity.velocity



window.BragiTests.DummySystemHP = DummySystemHP
window.BragiTests.DummySystemMovement = DummySystemMovement
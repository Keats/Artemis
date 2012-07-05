
window.BragiTests.DummySystemHP = {}
#window.BragiTests.DummySystemPosition = {}
#window.BragiTests.DummySystemName = {}

class DummySystemHP extends Bragi.EntityProcessingSystem

  constructor: () ->
    super "DummyComponentHP"


  initialize: () ->
    #world is added to the system when calling addSystem from system manager
    @dummyComponentHPMapper = new Bragi.ComponentMapper "DummyComponentHP", @world


  process: (entity) ->
    dummyComponentHP = @dummyComponentHPMapper.get entity
    dummyComponentHP.hp = 0

window.BragiTests.DummySystemHP = DummySystemHP
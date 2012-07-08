
describe "System Manager", ->

  world = null

  before () ->
    world = new Artemis.EntityWorld()

  describe "Instantiation", ->

    systemManager = null

    before () ->
      systemManager = new Artemis.SystemManager world

    it "should have the world instance as property", ->
      systemManager.world.should.be.an.instanceof Artemis.EntityWorld
    it "should have an empty object called systems", ->
      systemManager.systems.should.be.an.instanceof Object
      systemManager.systems.should.be.empty
    it "should have an empty array called allSystems", ->
      systemManager.allSystems.should.be.an.instanceof Array
      systemManager.allSystems.should.be.empty


  describe "Adding a system", ->
    system = null

    before () ->
      system = new Artemis.System "DummyComponentHP", "DummyComponentPosition"
      world.systemManager.addSystem system

    it "should have added a entry in the systems object and so it should have a length of 1", ->
      Object.keys(world.systemManager.systems).should.have.length 1

    it "should have pushed the system to the allSystems array", ->
      world.systemManager.allSystems.should.contain system


  describe "Getting a system", ->
    system = null
    systemFound = null

    before () ->
      system = new Artemis.System "DummyComponentHP", "DummyComponentPosition"
      world.systemManager.addSystem system
      systemFound = world.systemManager.getSystem "System"


    it "system and systemFound should be equal", ->
      system.should.be.equal systemFound


  describe "Initializing all systems", ->
    systemFound = null

    before () ->
      system = new ArtemisTests.DummySystemHP
      world.systemManager.addSystem system

      world.systemManager.initializeAll()

      systemFound = world.systemManager.getSystem "DummySystemHP"


    it "should have a dummyComponentHPMapper parameter", ->
      systemFound.dummyComponentHPMapper.should.be.an.instanceof Artemis.ComponentMapper
      systemFound.dummyComponentHPMapper.componentName.should.be.equal "DummyComponentHP"
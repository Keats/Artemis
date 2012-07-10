
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
    it "should have 2 objects to store the systems by exec type", ->
      systemManager.updateSystems.should.be.an.instanceof Object
      systemManager.updateSystems.should.be.empty
      systemManager.renderSystems.should.be.an.instanceof Object
      systemManager.renderSystems.should.be.empty


  describe "Adding a system", ->
    system = null
    systemManager = null

    before () ->
      systemManager = new Artemis.SystemManager world
      system = new Artemis.System "DummyComponentHP", "DummyComponentPosition"
      systemManager.addSystem system, "update"

    it "should have added a entry in the systems object and so it should have a length of 1", ->
      Object.keys(systemManager.systems).should.have.length 1
    it "should have pushed the system to the allSystems array", ->
      systemManager.allSystems.should.contain system
    it "should have set the default priority to 0", ->
      systemManager.updateSystems[0].should.be.an.instanceof Object
    it "should have pushed the system to the updateSystems object", ->
      Object.keys(systemManager.updateSystems[0]).should.have.length 1


  describe "Adding a system without an exec type should throw an error", ->
    system = null
    badFunction = null
    systemManager = null

    before () ->
      systemManager = new Artemis.SystemManager world
      system = new Artemis.System "DummyComponentHP", "DummyComponentPosition"
      badFunction = ->
        systemManager.addSystem system

    it "should throw an error", ->
      badFunction.should.throw "Invalid type when adding a system: it can only be the string update or draw"
    it "should not have pushed in any objects/array", ->
      systemManager.allSystems.should.be.empty
      systemManager.updateSystems.should.be.empty
      systemManager.renderSystems.should.be.empty


  describe "Getting a system", ->
    system = null
    systemFound = null
    systemManager = null

    before () ->
      systemManager = new Artemis.SystemManager world
      system = new Artemis.System "DummyComponentHP", "DummyComponentPosition"
      systemManager.addSystem system, "update"
      systemFound = systemManager.getSystem "System"


    it "system and systemFound should be equal", ->
      system.should.be.equal systemFound


  describe "Initializing all systems", ->
    systemFound = null

    before () ->
      systemManager = new Artemis.SystemManager world
      system = new ArtemisTests.DummySystemHP
      systemManager.addSystem system, "update"

      systemManager.initializeAll()

      systemFound = systemManager.getSystem "DummySystemHP"


    it "should have a dummyComponentHPMapper parameter", ->
      systemFound.dummyComponentHPMapper.should.be.an.instanceof Artemis.ComponentMapper
      systemFound.dummyComponentHPMapper.componentName.should.be.equal "DummyComponentHP"


  describe "Updating synchronously several update type systems on different priorities", ->
    component = null
    component2 = null

    before () ->
      world = new Artemis.EntityWorld()
      
      entity = world.createEntity()
      system = new ArtemisTests.DummySystemHP
      system2 = new ArtemisTests.DummySystemMovement

      world.systemManager.addSystem system, "update", 0 
      world.systemManager.addSystem system2, "update", 1

      world.systemManager.initializeAll()

      component = new ArtemisTests.DummyComponentHP 100
      component2 = new ArtemisTests.DummyComponentPosition 1,1,1
      component3 =  new ArtemisTests.DummyComponentVelocity 2, 25

      entity.addComponent component
      entity.addComponent component2
      entity.addComponent component3
      world.entityManager.refresh entity

      world.systemManager.updateSynchronous "update"

      component = entity.getComponent "DummyComponentHP"
      component2 = entity.getComponent "DummyComponentPosition"


    it "should have processed the DummySystemHP", ->
      component.hp.should.be.equal 0
    it "should have processed the DummySystemMovement", ->
      component2.x.should.be.equal 3
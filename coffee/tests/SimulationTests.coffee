
describe "Game simulation", ->

  describe "Creating the game and not calling refresh on the entity", ->

    world = null
    entity = null
    movementSystem = null

    before () ->
      world = new Artemis.EntityWorld()

      movementSystem = world.systemManager.addSystem new ArtemisTests.DummySystemMovement,"update"

      entity = world.createEntity()

      entity.addComponent new ArtemisTests.DummyComponentPosition 1,1,1
      entity.addComponent new ArtemisTests.DummyComponentVelocity 2, 25

      world.systemManager.initializeAll()

      world.loopStart()

      world.systemManager.updateSynchronous "update"

    it "should have added the system", ->
      world.systemManager.allSystems[0].should.be.an.instanceof ArtemisTests.DummySystemMovement
      world.systemManager.systems.hasOwnProperty("DummySystemMovement").should.be.true
    it "should not have registered the entity as active", ->
      Object.keys(movementSystem.actives).should.have.length 0


  describe "Creating the game and calling refresh on the entity", ->

    world = null
    entity = null
    movementSystem = null
    component = null

    before () ->
      world = new Artemis.EntityWorld()

      movementSystem = world.systemManager.addSystem new ArtemisTests.DummySystemMovement, "update"

      entity = world.createEntity()

      entity.addComponent new ArtemisTests.DummyComponentPosition 1,1,1
      entity.addComponent new ArtemisTests.DummyComponentVelocity 2, 25
      entity.refresh()

      world.systemManager.initializeAll()

      world.loopStart()

      world.systemManager.updateSynchronous "update"

      component = entity.getComponent "DummyComponentPosition"

    it "should have added the system", ->
      world.systemManager.allSystems[0].should.be.an.instanceof ArtemisTests.DummySystemMovement
      world.systemManager.systems.hasOwnProperty("DummySystemMovement").should.be.true
    it "should have registered the entity as active", ->
      Object.keys(movementSystem.actives).should.have.length 1
    it "should have modified the x position of the component", ->
      component.x.should.be.equal 3
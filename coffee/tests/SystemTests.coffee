
describe "Systems", ->

  describe "Instatiating a system with several components", ->

    system = null

    before () ->
      system = new Artemis.System "DummyComponentHP", "DummyComponentPosition"

    it "should have typeFlags equal to 3 since we added 2 components", ->
      system.typeFlags.should.be.equal 3


  describe "Processing an entity (as a system inheriting System)", ->

    system = null
    component = null

    before () ->
      world = new Artemis.EntityWorld()
      entity = new Artemis.Entity world, 0

      component = new ArtemisTests.DummyComponentHP 100
      entity.addComponent component

      system = new ArtemisTests.DummySystemHP

      #Not needed in real use, should be done via other methods
      system.world = world
      system.initialize()

      system.processEntity entity

      component = entity.getComponent "DummyComponentHP"


    it "should use the System constructor and have typeFlags equal to 1 since we added 1 component", ->
      system.typeFlags.should.be.equal 1

    it "component should have HP equal to 0", ->
      component.hp.should.be.equal 0
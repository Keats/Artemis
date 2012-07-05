
describe "EntityProcessingSystems", ->


  describe "Instatiating a system", ->

    system = null

    before () ->
      system = new BragiTests.DummySystemHP

    it "should use the System constructor and have typeFlags equal to 1 since we added 1 component", ->
      system.typeFlags.should.be.equal 1


  describe "Processing several entities", ->

    system = null
    component1 = null
    component2 = null

    before () ->
      world = new Bragi.EntityWorld()

      entity1 = new Bragi.Entity world, 0
      entity2 = new Bragi.Entity world, 0

      component = new BragiTests.DummyComponentHP 100

      entity1.addComponent component
      entity2.addComponent component

      system = new BragiTests.DummySystemHP

      #Not needed in real use, should be done via other methods
      system.world = world
      system.initialize()

      entities = [entity1, entity2]
      console.log entities
      system.processEntities entities

      component1 = entity1.getComponent "DummyComponentHP"
      component2 = entity2.getComponent "DummyComponentHP"


    it "should use the System constructor and have typeFlags equal to 1 since we added 1 component", ->
      system.typeFlags.should.be.equal 1

    it "component1 should have HP equal to 0", ->
      component1.hp.should.be.equal 0

    it "component2 should have HP equal to 0", ->
      component2.hp.should.be.equal 0
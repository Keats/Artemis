
describe "Entity", ->

  world = null

  before () ->
    world = new Bragi.EntityWorld()

  describe "Instantiation", ->

    entity = null

    before () ->
      entity = new Bragi.Entity world, 0
      
    it "should have the world instance as property", ->
      entity.world.should.be.an.instanceof Bragi.EntityWorld
    it "should have an id equal to 0", ->
      entity.id.should.be.equal 0


  describe "Adding a component", ->

    entity = null
    notInheritingFunction = null

    before () ->
      entity = new Bragi.Entity world, 0

      component = new BragiTests.DummyComponentHP 100
      entity.addComponent component

      notInheriting = {}

      notInheritingFunction = (notInheriting) ->
        entityManager._addComponent entity, notInheriting


    it "should throw an error if calling with an object not inheriting from Bragi.Component", ->
      notInheritingFunction.should.Throw Error
    it "should have a component stored in bits", ->
      entity.typeBits.should.not.be.equal 0


  describe "Removing a component", ->

    entity = null

    before () ->
      entity = new Bragi.Entity world, 0
      component = new BragiTests.DummyComponentHP 100
      entity.addComponent component
      entity.removeComponent "DummyComponentHP"

    it "should not have a component stored in bits", ->
      entity.typeBits.should.be.equal 0


  describe "Getting a component", ->

    entity = null
    component = null

    before () ->
      entity = new Bragi.Entity world, 0
      component = new BragiTests.DummyComponentHP 100
      entity.addComponent component
      component = entity.getComponent "DummyComponentHP"

    it "should get a component DummyComponentHP with hp equal to 100", ->
      component.should.be.an.instanceof BragiTests.DummyComponentHP
      component.hp.should.be.equal 100

  describe "Deleting itself", ->

    entity = null

    before () ->
      entity = new Bragi.Entity world, 0
      entity.delete()

    it "entity should be in the deleted array of EntityWorld", ->
      world.deleted.should.include entity


  describe "Checking if it's active", ->

    entity = null
    state1 = null
    state2 = null

    before () ->
      #need to go through the entity manager for this one
      entity = world.createEntity()
      state1 = entity.isActive()
      entity.delete()
      state2 = entity.isActive()

    it "state1 should be active", ->
      state1.should.be.true
    it "state2 should be inactive", ->
      state2.should.not.be.true


  describe "Tagging itself", ->

    entity = null

    before () ->
      entity = world.createEntity()
      entity.setTag "testing"

    it "should have tagged the entity with testing", ->
      world.tagManager.get("testing").should.be.equal entity


  describe "Adding itself to a group", ->

    entity = null

    before () ->
      entity = world.createEntity()
      entity.setGroup "testing"

    it "should have added the entity to the testing group", ->
      world.groupManager.get("testing")[0].should.be.equal entity
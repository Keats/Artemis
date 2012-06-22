
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
      entity.addComponent new BragiTests.DummyComponentHP 100

      notInheriting = new Object()

      notInheritingFunction = (notInheriting) ->
        entityManager._addComponent entity, notInheriting


    it "should throw an error if calling with an object not inheriting from Bragi.Component", ->
      notInheritingFunction.should.Throw Error
    it "should have a component stored in bits", ->
      entity.bits.should.not.be.equal 0


  describe "Removing a component", ->

    entity = null

    before () ->
      entity = new Bragi.Entity world, 0
      component = new BragiTests.DummyComponentHP 100
      entity.addComponent component
      entity.removeComponent "DummyComponentHP"

    it "should not have a component stored in bits", ->
      entity.bits.should.be.equal 0


  describe "Getting a component", ->

    entity = null
    notInheritingFunction = null

    before () ->
      entity = new Bragi.Entity world, 0
      component = new BragiTests.DummyComponentHP 100
      entity.addComponent component
      test = entity.getComponent BragiTests.DummyComponentHP

    it "should throw an error if calling with an object not inheriting from Bragi.Component", ->
      fail
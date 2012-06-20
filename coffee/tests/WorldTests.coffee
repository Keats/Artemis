
describe "World", ->

  world = null

  describe "Instantiation", ->

    before () ->
      world = new Bragi.World()

    it "should have an Entity Manager", ->
      world.entityManager.should.be.an.instanceof Bragi.EntityManager
    it "should have a System Manager", ->
      world.systemManager.should.be.an.instanceof Bragi.SystemManager
    it "should have a Tag Manager", ->
      world.tagManager.should.be.an.instanceof Bragi.TagManager
    it "should have an empty array called deleted", ->
      world.deleted.should.be.an.instanceof(Array)
      world.deleted.should.be.empty


  describe "Create of an entity", ->

    entity = null

    before () ->
      world = new Bragi.World()
      entity = world.createEntity()

    it "should have created an entity", ->
      entity.should.be.an.instanceof Bragi.Entity
    it "entity should have the world instance as property", ->
      entity.world.should.be.equal world


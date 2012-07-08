
describe "World", ->

  world = null

  describe "Instantiation", ->

    before () ->
      world = new Artemis.EntityWorld()

    it "should have an Entity Manager", ->
      world.entityManager.should.be.an.instanceof Artemis.EntityManager
    it "should have a System Manager", ->
      world.systemManager.should.be.an.instanceof Artemis.SystemManager
    it "should have a Tag Manager", ->
      world.tagManager.should.be.an.instanceof Artemis.TagManager
    it "should have a Group Manager", ->
      world.groupManager.should.be.an.instanceof Artemis.GroupManager
    it "should have an empty array called deleted", ->
      world.deleted.should.be.an.instanceof Array
      world.deleted.should.be.empty


  describe "Creating an entity", ->

    entity = null

    before () ->
      world = new Artemis.EntityWorld()
      entity = world.createEntity()

    it "should have created an entity", ->
      entity.should.be.an.instanceof Artemis.Entity
    it "entity should have the world instance as property", ->
      entity.world.should.be.equal world


  describe "Retrieving an entity", ->

    entity = null
    dummy = null

    before () ->
      world = new Artemis.EntityWorld()
      dummy = world.createEntity()
      entity = world.getEntity dummy.id

    it "should have an entity", ->
      entity.should.be.an.instanceof Artemis.Entity
    it "entity should be equal to dummy", ->
      entity.should.be.equal dummy

  describe "Deleting an entity", ->

    entity = null

    before () ->
      world = new Artemis.EntityWorld()
      entity = world.createEntity()
      world.deleteEntity entity

    it "entity should be in the deleted array of EntityWorld", ->
      world.deleted.should.include entity
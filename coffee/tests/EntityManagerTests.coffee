
describe "Entity Manager", ->

  world = null

  before () ->
    world = new Bragi.World()

  describe "Instantiation", ->

    entityManager = null

    before () ->
      entityManager = new Bragi.EntityManager world

    it "should have the world instance as property", ->
      entityManager.world.should.be.an.instanceof Bragi.World
    it "should have nextId equal to 0", ->
      entityManager.nextId.should.be.equal 0
    it "should have an empty object called entities", ->
      entityManager.entities.should.be.an.instanceof(Object)
      entityManager.entities.should.be.empty


  describe "Creating entities", ->

    entityManager = null
    entity = null
    entity2 = null

    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager.create()
      entity2 = entityManager.create()

    it "should have created 2 entities", ->
      entity.should.be.an.instanceof(Bragi.Entity)
      entity2.should.be.an.instanceof(Bragi.Entity)
    it "entities should have differents ids", ->
      entity.id.should.be.not.equal entity2.id      
    it "should have nextId equal to 2", ->
      entityManager.nextId.should.be.equal 2
    it "should have an object called entities with a length of 2", ->
      Object.keys(entityManager.entities).should.have.length 2
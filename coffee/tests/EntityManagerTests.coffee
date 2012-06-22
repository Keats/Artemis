
describe "Entity Manager", ->

  world = null

  before () ->
    world = new Bragi.EntityWorld()

  describe "Instantiation", ->

    entityManager = null

    before () ->
      entityManager = new Bragi.EntityManager world

    it "should have the world instance as property", ->
      entityManager.world.should.be.an.instanceof Bragi.EntityWorld
    it "should have nextId equal to 0", ->
      entityManager.nextId.should.be.equal 0
    it "should have an empty object called entities", ->
      entityManager.entities.should.be.an.instanceof Object
      entityManager.entities.should.be.empty
    it "should have an empty object called componentsByType", ->
      entityManager.componentsByType.should.be.an.instanceof Object
      entityManager.componentsByType.should.be.empty


  describe "Creating entities", ->

    entityManager = null
    entity = null
    entity2 = null

    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager._create()
      entity2 = entityManager._create()

    it "should have created 2 entities", ->
      entity.should.be.an.instanceof Bragi.Entity
      entity2.should.be.an.instanceof Bragi.Entity
    it "entities should have differents ids", ->
      entity.id.should.be.not.equal entity2.id      
    it "should have nextId equal to 2", ->
      entityManager.nextId.should.be.equal 2
    it "should have an object called entities with a length of 2", ->
      Object.keys(entityManager.entities).should.have.length 2


  describe "Retrieving entities", ->

    entityManager = null
    entity = null
    entity2 = null

    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager._create()
      entity2 = entityManager._getEntity entity.id

    it "should have retrieved entity", ->
      entity2.should.be.equal entity


  describe "Deleting entities", ->

    entityManager = null
    entity = null

    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager._create()
      entityManager.remove entity

    it "should have no entities in the entities object", ->
      Object.keys(entityManager.entities).should.have.length 0


  describe "Adding components to entities", ->

    entityManager = null
    entity = null
    component = null

    components = []
    components[0] = []
    components[1] = []

    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager._create()
      entityManager._addComponent entity, new BragiTests.DummyComponentHP 100
      entityManager._addComponent entity, new BragiTests.DummyComponentPosition 100

      entity2 = entityManager._create()
      entityManager._addComponent entity2, new BragiTests.DummyComponentHP 100

      for key of entityManager.componentsByType
        obj = entityManager.componentsByType[key]
        for prop of obj
          components[key].push obj[prop]

    it "entity should have bits equal 3 (HP + Position components)", ->
      entity.bits.should.be.equal 3
    it "should have the object componentsByType referencing all entities/components associations", ->
      Object.keys(entityManager.componentsByType).should.have.length 2
      components[0].should.have.length 2
      components[0][0].should.be.an.instanceof BragiTests.DummyComponentHP
      components[0][1].should.be.an.instanceof BragiTests.DummyComponentHP
      components[1].should.have.length 1
      components[1][0].should.be.an.instanceof BragiTests.DummyComponentPosition

  describe "Removing components from entities", ->

    entityManager = null
    entity = null
    component = null

    components = []
    components[0] = []
    components[1] = []

    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager._create()
      entityManager._addComponent entity, new BragiTests.DummyComponentHP 100
      entityManager._addComponent entity, new BragiTests.DummyComponentPosition 100

      entity2 = entityManager._create()
      entityManager._addComponent entity2, new BragiTests.DummyComponentHP 100

      entityManager._removeComponent entity, "DummyComponentHP"

      for key of entityManager.componentsByType
        obj = entityManager.componentsByType[key]
        for prop of obj
          components[key].push obj[prop]

    it "entity should have bits equal 3 (HP + Position components)", ->
      entity.bits.should.be.equal 2
    it "should have the object componentsByType referencing all entities/components associations", ->
      Object.keys(entityManager.componentsByType).should.have.length 2
      components[0].should.have.length 1
      components[0][0].should.be.an.instanceof BragiTests.DummyComponentHP
      components[1].should.have.length 1
      components[1][0].should.be.an.instanceof BragiTests.DummyComponentPosition


  describe "Removing all components from an entity", ->

    entityManager = null
    entity = null


    before () ->
      entityManager = new Bragi.EntityManager world
      entity = entityManager._create()
      entityManager._addComponent entity, new BragiTests.DummyComponentHP 100
      entityManager._addComponent entity, new BragiTests.DummyComponentPosition 100

      entityManager._removeAllComponents entity

    it "entity should have not components for this entity in componentsByType", ->
      Object.keys(entityManager.componentsByType).should.have.length 0
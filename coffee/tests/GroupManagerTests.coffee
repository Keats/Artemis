
describe "Group Manager", ->

  describe "Adding an entity to a group", ->

    world = null
    entity = null

    before () ->
      world = new Bragi.EntityWorld()
      entity = new Bragi.Entity world, 0
      world.groupManager.set "testing", entity

    it "should have created the testing group", ->
      world.groupManager.entitiesByGroup["testing"].should.have.length 1
    it "should have the entity stored in the testing group", ->
      world.groupManager.entitiesByGroup["testing"][0].should.be.equal entity
    it "the groupByEntity should reference the group via the entity id", ->
      world.groupManager.groupByEntity[entity.id].should.be.equal "testing"


  describe "Adding an already registered entity to a new group", ->

    world = null
    entity = null

    before () ->
      world = new Bragi.EntityWorld()
      entity = new Bragi.Entity world, 0
      world.groupManager.set "testing", entity
      world.groupManager.set "testing2", entity

    it "should have removed the testing group", ->
      world.groupManager.entitiesByGroup.hasOwnProperty("testing").should.be.false
    it "should have the entity stored in the testing2 group", ->
      world.groupManager.entitiesByGroup["testing2"][0].should.be.equal entity
    it "the groupByEntity should reference the testing 2 group only via the entity id", ->
      world.groupManager.groupByEntity[entity.id].should.be.equal "testing2"
      world.groupManager.groupByEntity[entity.id].should.not.be.equal "testing"


  describe "Getting all the entities of a group", ->

    world = null
    entity = null
    entity2 = null
    entitiesFound = null

    before () ->
      world = new Bragi.EntityWorld()
      entity = new Bragi.Entity world, 0
      entity2 = new Bragi.Entity world, 1

      world.groupManager.set "testing", entity
      world.groupManager.set "testing", entity2

      entitiesFound = world.groupManager.get "testing"

    it "should have returned an array containing 2 entities", ->
      entitiesFound.should.have.length 2
    it "should contain the 2 entities created", ->
      entitiesFound[0].should.be.equal entity
      entitiesFound[1].should.be.equal entity2

  describe "Removing an entity from a group", ->

    world = null
    entity = null
    entity2 = null

    before () ->
      world = new Bragi.EntityWorld()
      entity = new Bragi.Entity world, 0
      entity2 = new Bragi.Entity world, 1

      world.groupManager.set "testing", entity
      world.groupManager.set "testing", entity2

      world.groupManager.remove entity2

    it "should have only 1 entity in the testing group", ->
      world.groupManager.entitiesByGroup["testing"].should.have.length 1
    it "should not have a reference to entity2", ->
      world.groupManager.groupByEntity.hasOwnProperty(entity2.id).should.be.false
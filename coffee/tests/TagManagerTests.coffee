
describe "Tag Manager", ->

  world = null
  entity = null

  before () ->
    world = new Artemis.EntityWorld()
    entity = world.createEntity()

  describe "Registering a tag", ->

    before () ->
      world.tagManager.register "testing", entity

    it "should have added a tag/entity mapping in taggedEntities", ->
      world.tagManager.taggedEntities["testing"].should.be.equal entity


  describe "Unregistering a tag", ->

    before () ->
      world.tagManager.register "testing", entity
      world.tagManager.unregister "testing"

    it "should not have a tag/entity mapping in taggedEntities", ->
      Object.keys(world.tagManager.taggedEntities).should.have.length 0


  describe "Finding an entity via a tag", ->

    entity_found = null

    before () ->
      world.tagManager.register "testing", entity
      entity_found = world.tagManager.get "testing"

    it "the entity found should be equal to the one registered", ->
      entity_found.should.be.equal entity

  describe "Finding out if an entity has a tag", ->

    result_ok = null
    result_bad = null

    before () ->
      world.tagManager.register "testing", entity

      result_ok = world.tagManager.isRegistered "testing"
      result_bad = world.tagManager.isRegistered "wrong"

    it "should return true if a tag is registered", ->
      result_ok.should.be.true
    it "should return false if a tag is not registered", ->
      result_bad.should.not.be.true
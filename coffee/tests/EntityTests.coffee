
describe "Entity Manager", ->

  world = null

  before () ->
    world = new Bragi.World()

  describe "Instantiation", ->

    entity = null

    before () ->
      entity = new Bragi.Entity world, 0

    it "should have the world instance as property", ->
      entity.world.should.be.an.instanceof Bragi.World
    it "should have an id equal to 0", ->
      entity.id.should.be.equal 0
    it "should have an empty array called components", ->
      entity.components.should.be.an.instanceof(Array)
      entity.components.should.be.empty
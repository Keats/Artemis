
describe "Component Type Manager", ->

  describe "Getting type and ids", ->

    typeComponentHP = null
    typeComponentHP2 = null
    typeComponentPosition = null
    typeComponentPositionByString = null
    typeNotInheriting = null

    bit = null
    id = null

    before () ->
      componentHP = new ArtemisTests.DummyComponentHP 100
      componentHP2 = new ArtemisTests.DummyComponentHP 1000
      componentPosition = new ArtemisTests.DummyComponentPosition 1, 2, 3
      notInheriting = new Object()

      #Need to use a function to get the throw error
      typeNotInheriting = (notInheriting) ->
        Artemis.ComponentTypeManager.getType notInheriting

      typeComponentHP = Artemis.ComponentTypeManager.getType componentHP
      typeComponentHP2 = Artemis.ComponentTypeManager.getType componentHP2
      typeComponentPosition = Artemis.ComponentTypeManager.getType componentPosition
      typeComponentPositionByString = Artemis.ComponentTypeManager.getTypeByName "DummyComponentPosition"

      bit = Artemis.ComponentTypeManager.getBit componentHP
      id = Artemis.ComponentTypeManager.getId componentHP


    it "should throw an error if calling getType with an object not inheriting from Artemis.Component", ->
      typeNotInheriting.should.Throw Error
    it "should get the same type for typeComponentHP and typeComponentHP2", ->
      typeComponentHP.should.be.equal typeComponentHP2
    it "should get a different type for typeComponentHP and typeComponentPosition", ->
      typeComponentHP.should.not.be.equal typeComponentPosition
    it "should get the same type for typeComponentPosition and typeComponentPositionByString", ->
      typeComponentPosition.should.be.equal typeComponentPositionByString
    it "should get a bit for typeComponentHP of 1", ->
      bit.should.be.equal 1
    it "should get an id for typeComponentHP of 0", ->
      id.should.be.equal 0

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
      componentHP = new BragiTests.DummyComponentHP 100
      componentHP2 = new BragiTests.DummyComponentHP 1000
      componentPosition = new BragiTests.DummyComponentPosition 1, 2, 3
      notInheriting = new Object()

      #Need to use a function to get the throw error
      typeNotInheriting = (notInheriting) ->
        Bragi.ComponentTypeManager.getType notInheriting

      typeComponentHP = Bragi.ComponentTypeManager.getType componentHP
      typeComponentHP2 = Bragi.ComponentTypeManager.getType componentHP2
      typeComponentPosition = Bragi.ComponentTypeManager.getType componentPosition
      typeComponentPositionByString = Bragi.ComponentTypeManager.getTypeByName "DummyComponentPosition"

      bit = Bragi.ComponentTypeManager.getBit componentHP
      id = Bragi.ComponentTypeManager.getId componentHP


    it "should throw an error if calling getType with an object not inheriting from Bragi.Component", ->
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
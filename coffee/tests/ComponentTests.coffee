
describe "Components", ->

  describe "Inheritance", ->

    component = null

    before () ->
      component = new BragiTests.DummyComponentHP(100)

    it "should inherit from Bragi.Component", ->
      component.should.be.an.instanceof Bragi.Component
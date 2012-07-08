
describe "Components", ->

  describe "Inheritance", ->

    component = null

    before () ->
      component = new ArtemisTests.DummyComponentHP(100)

    it "should inherit from Artemis.Component", ->
      component.should.be.an.instanceof Artemis.Component
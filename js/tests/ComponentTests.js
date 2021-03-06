// Generated by CoffeeScript 1.3.3
(function() {

  describe("Components", function() {
    return describe("Inheritance", function() {
      var component;
      component = null;
      before(function() {
        return component = new ArtemisTests.DummyComponentHP(100);
      });
      return it("should inherit from Artemis.Component", function() {
        return component.should.be.an["instanceof"](Artemis.Component);
      });
    });
  });

}).call(this);

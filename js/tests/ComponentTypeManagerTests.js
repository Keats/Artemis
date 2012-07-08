// Generated by CoffeeScript 1.3.3
(function() {

  describe("Component Type Manager", function() {
    return describe("Getting type and ids", function() {
      var bit, id, typeComponentHP, typeComponentHP2, typeComponentPosition, typeComponentPositionByString, typeNotInheriting;
      typeComponentHP = null;
      typeComponentHP2 = null;
      typeComponentPosition = null;
      typeComponentPositionByString = null;
      typeNotInheriting = null;
      bit = null;
      id = null;
      before(function() {
        var componentHP, componentHP2, componentPosition, notInheriting;
        componentHP = new ArtemisTests.DummyComponentHP(100);
        componentHP2 = new ArtemisTests.DummyComponentHP(1000);
        componentPosition = new ArtemisTests.DummyComponentPosition(1, 2, 3);
        notInheriting = new Object();
        typeNotInheriting = function(notInheriting) {
          return Artemis.ComponentTypeManager.getType(notInheriting);
        };
        typeComponentHP = Artemis.ComponentTypeManager.getType(componentHP);
        typeComponentHP2 = Artemis.ComponentTypeManager.getType(componentHP2);
        typeComponentPosition = Artemis.ComponentTypeManager.getType(componentPosition);
        typeComponentPositionByString = Artemis.ComponentTypeManager.getTypeByName("DummyComponentPosition");
        bit = Artemis.ComponentTypeManager.getBit(componentHP);
        return id = Artemis.ComponentTypeManager.getId(componentHP);
      });
      it("should throw an error if calling getType with an object not inheriting from Artemis.Component", function() {
        return typeNotInheriting.should.Throw(Error);
      });
      it("should get the same type for typeComponentHP and typeComponentHP2", function() {
        return typeComponentHP.should.be.equal(typeComponentHP2);
      });
      it("should get a different type for typeComponentHP and typeComponentPosition", function() {
        return typeComponentHP.should.not.be.equal(typeComponentPosition);
      });
      it("should get the same type for typeComponentPosition and typeComponentPositionByString", function() {
        return typeComponentPosition.should.be.equal(typeComponentPositionByString);
      });
      it("should get a bit for typeComponentHP of 1", function() {
        return bit.should.be.equal(1);
      });
      return it("should get an id for typeComponentHP of 0", function() {
        return id.should.be.equal(0);
      });
    });
  });

}).call(this);

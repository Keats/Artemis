// Generated by CoffeeScript 1.3.3
(function() {

  describe("Systems", function() {
    describe("Instatiating a system with several components", function() {
      var system;
      system = null;
      before(function() {
        return system = new Bragi.System("DummyComponentHP", "DummyComponentPosition");
      });
      return it("should have typeFlags equal to 3 since we added 2 components", function() {
        return system.typeFlags.should.be.equal(3);
      });
    });
    return describe("Processing an entity (as a system inheriting System)", function() {
      var component, system;
      system = null;
      component = null;
      before(function() {
        var entity, world;
        world = new Bragi.EntityWorld();
        entity = new Bragi.Entity(world, 0);
        component = new BragiTests.DummyComponentHP(100);
        entity.addComponent(component);
        system = new BragiTests.DummySystemHP;
        system.world = world;
        system.initialize();
        system.processEntity(entity);
        return component = entity.getComponent("DummyComponentHP");
      });
      it("should use the System constructor and have typeFlags equal to 1 since we added 1 component", function() {
        return system.typeFlags.should.be.equal(1);
      });
      return it("component should have HP equal to 0", function() {
        return component.hp.should.be.equal(0);
      });
    });
  });

}).call(this);

// Generated by CoffeeScript 1.3.3
(function() {

  describe("Game simulation", function() {
    describe("Creating the game and not calling refresh on the entity", function() {
      var entity, movementSystem, world;
      world = null;
      entity = null;
      movementSystem = null;
      before(function() {
        world = new Bragi.EntityWorld();
        movementSystem = world.systemManager.addSystem(new BragiTests.DummySystemMovement);
        entity = world.createEntity();
        entity.addComponent(new BragiTests.DummyComponentPosition(1, 1, 1));
        entity.addComponent(new BragiTests.DummyComponentVelocity(2, 25));
        world.systemManager.initializeAll();
        world.loopStart();
        return movementSystem.process();
      });
      it("should have added the system", function() {
        world.systemManager.allSystems[0].should.be.an["instanceof"](BragiTests.DummySystemMovement);
        return world.systemManager.systems.hasOwnProperty("DummySystemMovement").should.be["true"];
      });
      return it("should not have registered the entity as active", function() {
        return Object.keys(movementSystem.actives).should.have.length(0);
      });
    });
    return describe("Creating the game and calling refresh on the entity", function() {
      var component, entity, movementSystem, world;
      world = null;
      entity = null;
      movementSystem = null;
      component = null;
      before(function() {
        world = new Bragi.EntityWorld();
        movementSystem = world.systemManager.addSystem(new BragiTests.DummySystemMovement);
        entity = world.createEntity();
        entity.addComponent(new BragiTests.DummyComponentPosition(1, 1, 1));
        entity.addComponent(new BragiTests.DummyComponentVelocity(2, 25));
        entity.refresh();
        world.systemManager.initializeAll();
        world.loopStart();
        movementSystem.process();
        return component = entity.getComponent("DummyComponentPosition");
      });
      it("should have added the system", function() {
        world.systemManager.allSystems[0].should.be.an["instanceof"](BragiTests.DummySystemMovement);
        return world.systemManager.systems.hasOwnProperty("DummySystemMovement").should.be["true"];
      });
      it("should have registered the entity as active", function() {
        return Object.keys(movementSystem.actives).should.have.length(1);
      });
      return it("should have modified the x position of the component", function() {
        return component.x.should.be.equal(3);
      });
    });
  });

}).call(this);

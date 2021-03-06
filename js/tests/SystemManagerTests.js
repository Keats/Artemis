// Generated by CoffeeScript 1.3.3
(function() {

  describe("System Manager", function() {
    var world;
    world = null;
    before(function() {
      return world = new Artemis.EntityWorld();
    });
    describe("Instantiation", function() {
      var systemManager;
      systemManager = null;
      before(function() {
        return systemManager = new Artemis.SystemManager(world);
      });
      it("should have the world instance as property", function() {
        return systemManager.world.should.be.an["instanceof"](Artemis.EntityWorld);
      });
      it("should have an empty object called systems", function() {
        systemManager.systems.should.be.an["instanceof"](Object);
        return systemManager.systems.should.be.empty;
      });
      it("should have an empty array called allSystems", function() {
        systemManager.allSystems.should.be.an["instanceof"](Array);
        return systemManager.allSystems.should.be.empty;
      });
      return it("should have 2 objects to store the systems by exec type", function() {
        systemManager.updateSystems.should.be.an["instanceof"](Object);
        systemManager.updateSystems.should.be.empty;
        systemManager.renderSystems.should.be.an["instanceof"](Object);
        return systemManager.renderSystems.should.be.empty;
      });
    });
    describe("Adding an update system", function() {
      var system, systemManager;
      system = null;
      systemManager = null;
      before(function() {
        systemManager = new Artemis.SystemManager(world);
        system = new Artemis.System("DummyComponentHP", "DummyComponentPosition");
        return systemManager.addSystem(system, "update");
      });
      it("should have added a entry in the systems object and so it should have a length of 1", function() {
        return Object.keys(systemManager.systems).should.have.length(1);
      });
      it("should have pushed the system to the allSystems array", function() {
        return systemManager.allSystems.should.contain(system);
      });
      it("should have set the default priority to 0", function() {
        return systemManager.updateSystems[0].should.be.an["instanceof"](Object);
      });
      return it("should have pushed the system to the updateSystems object", function() {
        return Object.keys(systemManager.updateSystems[0]).should.have.length(1);
      });
    });
    describe("Adding a draw system", function() {
      var system, systemManager;
      system = null;
      systemManager = null;
      before(function() {
        systemManager = new Artemis.SystemManager(world);
        system = new Artemis.System("DummyComponentHP", "DummyComponentPosition");
        return systemManager.addSystem(system, "draw");
      });
      it("should have added a entry in the systems object and so it should have a length of 1", function() {
        return Object.keys(systemManager.systems).should.have.length(1);
      });
      it("should have pushed the system to the allSystems array", function() {
        return systemManager.allSystems.should.contain(system);
      });
      it("should have set the default priority to 0", function() {
        return systemManager.renderSystems[0].should.be.an["instanceof"](Object);
      });
      return it("should have pushed the system to the updateSystems object", function() {
        return Object.keys(systemManager.renderSystems[0]).should.have.length(1);
      });
    });
    describe("Adding a system without an exec type should throw an error", function() {
      var badFunction, system, systemManager;
      system = null;
      badFunction = null;
      systemManager = null;
      before(function() {
        systemManager = new Artemis.SystemManager(world);
        system = new Artemis.System("DummyComponentHP", "DummyComponentPosition");
        return badFunction = function() {
          return systemManager.addSystem(system);
        };
      });
      it("should throw an error", function() {
        return badFunction.should["throw"]("Invalid type when adding a system: it can only be the string update or draw");
      });
      return it("should not have pushed in any objects/array", function() {
        systemManager.allSystems.should.be.empty;
        systemManager.updateSystems.should.be.empty;
        return systemManager.renderSystems.should.be.empty;
      });
    });
    describe("Getting a system", function() {
      var system, systemFound, systemManager;
      system = null;
      systemFound = null;
      systemManager = null;
      before(function() {
        systemManager = new Artemis.SystemManager(world);
        system = new Artemis.System("DummyComponentHP", "DummyComponentPosition");
        systemManager.addSystem(system, "update");
        return systemFound = systemManager.getSystem("System");
      });
      return it("system and systemFound should be equal", function() {
        return system.should.be.equal(systemFound);
      });
    });
    describe("Initializing all systems", function() {
      var systemFound;
      systemFound = null;
      before(function() {
        var system, systemManager;
        systemManager = new Artemis.SystemManager(world);
        system = new ArtemisTests.DummySystemHP;
        systemManager.addSystem(system, "update");
        systemManager.initializeAll();
        return systemFound = systemManager.getSystem("DummySystemHP");
      });
      return it("should have a dummyComponentHPMapper parameter", function() {
        systemFound.dummyComponentHPMapper.should.be.an["instanceof"](Artemis.ComponentMapper);
        return systemFound.dummyComponentHPMapper.componentName.should.be.equal("DummyComponentHP");
      });
    });
    return describe("Updating synchronously several update type systems on different priorities", function() {
      var component, component2;
      component = null;
      component2 = null;
      before(function() {
        var component3, entity, system, system2;
        world = new Artemis.EntityWorld();
        entity = world.createEntity();
        system = new ArtemisTests.DummySystemHP;
        system2 = new ArtemisTests.DummySystemMovement;
        world.systemManager.addSystem(system, "update", 0);
        world.systemManager.addSystem(system2, "update", 1);
        world.systemManager.initializeAll();
        component = new ArtemisTests.DummyComponentHP(100);
        component2 = new ArtemisTests.DummyComponentPosition(1, 1, 1);
        component3 = new ArtemisTests.DummyComponentVelocity(2, 25);
        entity.addComponent(component);
        entity.addComponent(component2);
        entity.addComponent(component3);
        world.entityManager.refresh(entity);
        world.systemManager.updateSynchronous("update");
        component = entity.getComponent("DummyComponentHP");
        return component2 = entity.getComponent("DummyComponentPosition");
      });
      it("should have processed the DummySystemHP", function() {
        return component.hp.should.be.equal(0);
      });
      return it("should have processed the DummySystemMovement", function() {
        return component2.x.should.be.equal(3);
      });
    });
  });

}).call(this);

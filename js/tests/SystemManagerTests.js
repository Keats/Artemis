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
      return it("should have an empty array called allSystems", function() {
        systemManager.allSystems.should.be.an["instanceof"](Array);
        return systemManager.allSystems.should.be.empty;
      });
    });
    describe("Adding a system", function() {
      var system;
      system = null;
      before(function() {
        system = new Artemis.System("DummyComponentHP", "DummyComponentPosition");
        return world.systemManager.addSystem(system);
      });
      it("should have added a entry in the systems object and so it should have a length of 1", function() {
        return Object.keys(world.systemManager.systems).should.have.length(1);
      });
      return it("should have pushed the system to the allSystems array", function() {
        return world.systemManager.allSystems.should.contain(system);
      });
    });
    describe("Getting a system", function() {
      var system, systemFound;
      system = null;
      systemFound = null;
      before(function() {
        system = new Artemis.System("DummyComponentHP", "DummyComponentPosition");
        world.systemManager.addSystem(system);
        return systemFound = world.systemManager.getSystem("System");
      });
      return it("system and systemFound should be equal", function() {
        return system.should.be.equal(systemFound);
      });
    });
    return describe("Initializing all systems", function() {
      var systemFound;
      systemFound = null;
      before(function() {
        var system;
        system = new ArtemisTests.DummySystemHP;
        world.systemManager.addSystem(system);
        world.systemManager.initializeAll();
        return systemFound = world.systemManager.getSystem("DummySystemHP");
      });
      return it("should have a dummyComponentHPMapper parameter", function() {
        systemFound.dummyComponentHPMapper.should.be.an["instanceof"](Artemis.ComponentMapper);
        return systemFound.dummyComponentHPMapper.componentName.should.be.equal("DummyComponentHP");
      });
    });
  });

}).call(this);

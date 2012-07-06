// Generated by CoffeeScript 1.3.3
(function() {

  describe("Entity", function() {
    var world;
    world = null;
    before(function() {
      return world = new Bragi.EntityWorld();
    });
    describe("Instantiation", function() {
      var entity;
      entity = null;
      before(function() {
        return entity = new Bragi.Entity(world, 0);
      });
      it("should have the world instance as property", function() {
        return entity.world.should.be.an["instanceof"](Bragi.EntityWorld);
      });
      return it("should have an id equal to 0", function() {
        return entity.id.should.be.equal(0);
      });
    });
    describe("Adding a component", function() {
      var entity, notInheritingFunction;
      entity = null;
      notInheritingFunction = null;
      before(function() {
        var component, notInheriting;
        entity = new Bragi.Entity(world, 0);
        component = new BragiTests.DummyComponentHP(100);
        entity.addComponent(component);
        notInheriting = {};
        return notInheritingFunction = function(notInheriting) {
          return entityManager._addComponent(entity, notInheriting);
        };
      });
      it("should throw an error if calling with an object not inheriting from Bragi.Component", function() {
        return notInheritingFunction.should.Throw(Error);
      });
      return it("should have a component stored in bits", function() {
        return entity.typeBits.should.not.be.equal(0);
      });
    });
    describe("Removing a component", function() {
      var entity;
      entity = null;
      before(function() {
        var component;
        entity = new Bragi.Entity(world, 0);
        component = new BragiTests.DummyComponentHP(100);
        entity.addComponent(component);
        return entity.removeComponent("DummyComponentHP");
      });
      return it("should not have a component stored in bits", function() {
        return entity.typeBits.should.be.equal(0);
      });
    });
    describe("Getting a component", function() {
      var component, entity;
      entity = null;
      component = null;
      before(function() {
        entity = new Bragi.Entity(world, 0);
        component = new BragiTests.DummyComponentHP(100);
        entity.addComponent(component);
        return component = entity.getComponent("DummyComponentHP");
      });
      return it("should get a component DummyComponentHP with hp equal to 100", function() {
        component.should.be.an["instanceof"](BragiTests.DummyComponentHP);
        return component.hp.should.be.equal(100);
      });
    });
    describe("Deleting itself", function() {
      var entity;
      entity = null;
      before(function() {
        entity = new Bragi.Entity(world, 0);
        return entity["delete"]();
      });
      return it("entity should be in the deleted array of EntityWorld", function() {
        return world.deleted.should.include(entity);
      });
    });
    describe("Checking if it's active", function() {
      var entity, state1, state2;
      entity = null;
      state1 = null;
      state2 = null;
      before(function() {
        entity = world.createEntity();
        state1 = entity.isActive();
        entity["delete"]();
        return state2 = entity.isActive();
      });
      it("state1 should be active", function() {
        return state1.should.be["true"];
      });
      return it("state2 should be inactive", function() {
        return state2.should.not.be["true"];
      });
    });
    describe("Tagging itself", function() {
      var entity;
      entity = null;
      before(function() {
        entity = world.createEntity();
        return entity.setTag("testing");
      });
      return it("should have tagged the entity with testing", function() {
        return world.tagManager.get("testing").should.be.equal(entity);
      });
    });
    return describe("Adding itself to a group", function() {
      var entity;
      entity = null;
      before(function() {
        entity = world.createEntity();
        return entity.setGroup("testing");
      });
      return it("should have added the entity to the testing group", function() {
        return world.groupManager.get("testing")[0].should.be.equal(entity);
      });
    });
  });

}).call(this);

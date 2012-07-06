// Generated by CoffeeScript 1.3.3
(function() {

  describe("Group Manager", function() {
    describe("Adding an entity to a group", function() {
      var entity, world;
      world = null;
      entity = null;
      before(function() {
        world = new Bragi.EntityWorld();
        entity = new Bragi.Entity(world, 0);
        return world.groupManager.set("testing", entity);
      });
      it("should have created the testing group", function() {
        return world.groupManager.entitiesByGroup["testing"].should.have.length(1);
      });
      it("should have the entity stored in the testing group", function() {
        return world.groupManager.entitiesByGroup["testing"][0].should.be.equal(entity);
      });
      return it("the groupByEntity should reference the group via the entity id", function() {
        return world.groupManager.groupByEntity[entity.id].should.be.equal("testing");
      });
    });
    describe("Adding an already registered entity to a new group", function() {
      var entity, world;
      world = null;
      entity = null;
      before(function() {
        world = new Bragi.EntityWorld();
        entity = new Bragi.Entity(world, 0);
        world.groupManager.set("testing", entity);
        return world.groupManager.set("testing2", entity);
      });
      it("should have removed the testing group", function() {
        return world.groupManager.entitiesByGroup.hasOwnProperty("testing").should.be["false"];
      });
      it("should have the entity stored in the testing2 group", function() {
        return world.groupManager.entitiesByGroup["testing2"][0].should.be.equal(entity);
      });
      return it("the groupByEntity should reference the testing 2 group only via the entity id", function() {
        world.groupManager.groupByEntity[entity.id].should.be.equal("testing2");
        return world.groupManager.groupByEntity[entity.id].should.not.be.equal("testing");
      });
    });
    describe("Getting all the entities of a group", function() {
      var entitiesFound, entity, entity2, world;
      world = null;
      entity = null;
      entity2 = null;
      entitiesFound = null;
      before(function() {
        world = new Bragi.EntityWorld();
        entity = new Bragi.Entity(world, 0);
        entity2 = new Bragi.Entity(world, 1);
        world.groupManager.set("testing", entity);
        world.groupManager.set("testing", entity2);
        return entitiesFound = world.groupManager.get("testing");
      });
      it("should have returned an array containing 2 entities", function() {
        return entitiesFound.should.have.length(2);
      });
      return it("should contain the 2 entities created", function() {
        entitiesFound[0].should.be.equal(entity);
        return entitiesFound[1].should.be.equal(entity2);
      });
    });
    return describe("Removing an entity from a group", function() {
      var entity, entity2, world;
      world = null;
      entity = null;
      entity2 = null;
      before(function() {
        world = new Bragi.EntityWorld();
        entity = new Bragi.Entity(world, 0);
        entity2 = new Bragi.Entity(world, 1);
        world.groupManager.set("testing", entity);
        world.groupManager.set("testing", entity2);
        return world.groupManager.remove(entity2);
      });
      it("should have only 1 entity in the testing group", function() {
        return world.groupManager.entitiesByGroup["testing"].should.have.length(1);
      });
      return it("should not have a reference to entity2", function() {
        return world.groupManager.groupByEntity.hasOwnProperty(entity2.id).should.be["false"];
      });
    });
  });

}).call(this);
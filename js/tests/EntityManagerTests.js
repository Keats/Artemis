// Generated by CoffeeScript 1.3.3
(function() {

  describe("Entity Manager", function() {
    var world;
    world = null;
    before(function() {
      return world = new Bragi.EntityWorld();
    });
    describe("Instantiation", function() {
      var entityManager;
      entityManager = null;
      before(function() {
        return entityManager = new Bragi.EntityManager(world);
      });
      it("should have the world instance as property", function() {
        return entityManager.world.should.be.an["instanceof"](Bragi.EntityWorld);
      });
      it("should have nextId equal to 0", function() {
        return entityManager.nextId.should.be.equal(0);
      });
      it("should have an empty object called entities", function() {
        entityManager.entities.should.be.an["instanceof"](Object);
        return entityManager.entities.should.be.empty;
      });
      return it("should have an empty object called componentsByType", function() {
        entityManager.componentsByType.should.be.an["instanceof"](Object);
        return entityManager.componentsByType.should.be.empty;
      });
    });
    describe("Creating entities", function() {
      var entity, entity2, entityManager;
      entityManager = null;
      entity = null;
      entity2 = null;
      before(function() {
        entityManager = new Bragi.EntityManager(world);
        entity = entityManager._create();
        return entity2 = entityManager._create();
      });
      it("should have created 2 entities", function() {
        entity.should.be.an["instanceof"](Bragi.Entity);
        return entity2.should.be.an["instanceof"](Bragi.Entity);
      });
      it("entities should have differents ids", function() {
        return entity.id.should.be.not.equal(entity2.id);
      });
      it("should have nextId equal to 2", function() {
        return entityManager.nextId.should.be.equal(2);
      });
      return it("should have an object called entities with a length of 2", function() {
        return Object.keys(entityManager.entities).should.have.length(2);
      });
    });
    describe("Retrieving entities", function() {
      var entity, entity2, entityManager;
      entityManager = null;
      entity = null;
      entity2 = null;
      before(function() {
        entityManager = new Bragi.EntityManager(world);
        entity = entityManager._create();
        return entity2 = entityManager._getEntity(entity.id);
      });
      return it("should have retrieved entity", function() {
        return entity2.should.be.equal(entity);
      });
    });
    describe("Deleting entities", function() {
      var entity, entityManager;
      entityManager = null;
      entity = null;
      before(function() {
        entityManager = new Bragi.EntityManager(world);
        entity = entityManager._create();
        return entityManager.remove(entity);
      });
      return it("should have no entities in the entities object", function() {
        return Object.keys(entityManager.entities).should.have.length(0);
      });
    });
    describe("Adding components to entities", function() {
      var component, components, entity, entityManager;
      entityManager = null;
      entity = null;
      component = null;
      components = [];
      components[0] = [];
      components[1] = [];
      before(function() {
        var entity2, key, obj, prop, _results;
        entityManager = new Bragi.EntityManager(world);
        entity = entityManager._create();
        entityManager._addComponent(entity, new BragiTests.DummyComponentHP(100));
        entityManager._addComponent(entity, new BragiTests.DummyComponentPosition(100));
        entity2 = entityManager._create();
        entityManager._addComponent(entity2, new BragiTests.DummyComponentHP(100));
        _results = [];
        for (key in entityManager.componentsByType) {
          obj = entityManager.componentsByType[key];
          _results.push((function() {
            var _results1;
            _results1 = [];
            for (prop in obj) {
              _results1.push(components[key].push(obj[prop]));
            }
            return _results1;
          })());
        }
        return _results;
      });
      it("entity should have bits equal 3 (HP + Position components)", function() {
        return entity.bits.should.be.equal(3);
      });
      return it("should have the object componentsByType referencing all entities/components associations", function() {
        Object.keys(entityManager.componentsByType).should.have.length(2);
        components[0].should.have.length(2);
        components[0][0].should.be.an["instanceof"](BragiTests.DummyComponentHP);
        components[0][1].should.be.an["instanceof"](BragiTests.DummyComponentHP);
        components[1].should.have.length(1);
        return components[1][0].should.be.an["instanceof"](BragiTests.DummyComponentPosition);
      });
    });
    return describe("Removing components from entities", function() {
      var component, components, entity, entityManager;
      entityManager = null;
      entity = null;
      component = null;
      components = [];
      components[0] = [];
      components[1] = [];
      before(function() {
        var entity2, key, obj, prop, _results;
        entityManager = new Bragi.EntityManager(world);
        entity = entityManager._create();
        entityManager._addComponent(entity, new BragiTests.DummyComponentHP(100));
        entityManager._addComponent(entity, new BragiTests.DummyComponentPosition(100));
        entity2 = entityManager._create();
        entityManager._addComponent(entity2, new BragiTests.DummyComponentHP(100));
        entityManager._removeComponent(entity, "DummyComponentHP");
        _results = [];
        for (key in entityManager.componentsByType) {
          obj = entityManager.componentsByType[key];
          _results.push((function() {
            var _results1;
            _results1 = [];
            for (prop in obj) {
              _results1.push(components[key].push(obj[prop]));
            }
            return _results1;
          })());
        }
        return _results;
      });
      it("entity should have bits equal 3 (HP + Position components)", function() {
        return entity.bits.should.be.equal(2);
      });
      return it("should have the object componentsByType referencing all entities/components associations", function() {
        Object.keys(entityManager.componentsByType).should.have.length(2);
        components[0].should.have.length(1);
        components[0][0].should.be.an["instanceof"](BragiTests.DummyComponentHP);
        components[1].should.have.length(1);
        return components[1][0].should.be.an["instanceof"](BragiTests.DummyComponentPosition);
      });
    });
  });

}).call(this);

(function() {
  var EntityManager;

  Bragi.EntityManager = {};

  EntityManager = (function() {

    function EntityManager() {}

    EntityManager.prototype.construct = function(world) {
      this.world = world;
      this.entities = {};
      return this.nextId = 0;
    };

    EntityManager.prototype.create = function() {
      var entity;
      entity = new Bragi.Entity(this.world, this.nextId);
      this.nextId++;
      return this.entities[entity.id] = entity;
    };

    EntityManager.prototype.remove = function(entity) {
      return delete this.entities[entity.id];
    };

    EntityManager.prototype.addComponent = function(entity, component) {};

    EntityManager.prototype.getComponent = function(entity, component) {};

    EntityManager.prototype.removeComponent = function(entity, component) {};

    EntityManager.prototype.removeAllComponents = function(entity) {};

    EntityManager.prototype.getEntity = function(id) {};

    EntityManager.prototype.isActive = function(id) {};

    return EntityManager;

  })();

  Bragi.EntityManager = EntityManager;

}).call(this);

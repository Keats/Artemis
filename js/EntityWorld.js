// Generated by CoffeeScript 1.3.3
(function() {
  var EntityWorld,
    __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  Bragi.EntityWorld = {};

  EntityWorld = (function() {

    function EntityWorld() {
      this.entityManager = new Bragi.EntityManager(this);
      this.systemManager = new Bragi.SystemManager(this);
      this.tagManager = new Bragi.TagManager(this);
      this.deleted = [];
    }

    EntityWorld.prototype.createEntity = function() {
      return this.entityManager._create();
    };

    EntityWorld.prototype.getEntity = function(id) {
      return this.entityManager._getEntity(id);
    };

    EntityWorld.prototype.deleteEntity = function(entity) {
      if (__indexOf.call(this.deleted, entity) < 0) {
        return this.deleted.push(entity);
      }
    };

    EntityWorld.prototype.getEntityByTag = function(tag) {};

    return EntityWorld;

  })();

  Bragi.EntityWorld = EntityWorld;

}).call(this);

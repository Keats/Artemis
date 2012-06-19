(function() {
  var World;

  Bragi.World = {};

  World = (function() {

    function World() {
      this.entityManager = new Bragi.EntityManager(this);
      this.systemManager = new Bragi.SystemManager(this);
      this.tagManager = new Bragi.TagManager(this);
      this.deleted = [];
    }

    World.prototype.deleteEntity = function(entity) {};

    World.prototype.createEntity = function() {};

    World.prototype.getEntity = function(id) {};

    World.prototype.getEntityByTag = function(tag) {};

    return World;

  })();

  Bragi.World = World;

}).call(this);

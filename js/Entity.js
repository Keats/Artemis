(function() {
  var Entity;

  Bragi.Entity = {};

  Entity = (function() {

    function Entity(world, id) {
      this.world = world;
      this.id = id;
      this.components = [];
    }

    Entity.prototype.addComponent = function(component) {};

    Entity.prototype.removeComponent = function(component) {};

    Entity.prototype.getComponents = function() {};

    Entity.prototype.isActive = function() {};

    Entity.prototype["delete"] = function() {};

    return Entity;

  })();

  Bragi.Entity = Entity;

}).call(this);

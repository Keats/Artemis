(function() {
  var ComponentMapper;

  Bragi.ComponentMapper = {};

  ComponentMapper = (function() {

    function ComponentMapper(componentClass, world) {
      this.world = world;
      this.em = world.entityManager;
      this.componentClass = componentClass;
    }

    ComponentMapper.prototype.get = function(entity) {};

    return ComponentMapper;

  })();

  Bragi.ComponentMapper = ComponentMapper;

}).call(this);

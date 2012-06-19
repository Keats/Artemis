(function() {
  var SystemManager;

  Bragi.SystemManager = {};

  SystemManager = (function() {

    function SystemManager() {}

    SystemManager.prototype.construct = function(world) {
      this.world = world;
    };

    SystemManager.prototype.addSystem = function(system) {};

    SystemManager.prototype.getSystems = function() {};

    return SystemManager;

  })();

  Bragi.SystemManager = SystemManager;

}).call(this);

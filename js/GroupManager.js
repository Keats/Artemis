(function() {
  var GroupManager;

  Bragi.GroupManager = {};

  GroupManager = (function() {

    function GroupManager() {}

    GroupManager.prototype.construct = function(world) {
      this.world = world;
      return this.groupedEntities = {};
    };

    GroupManager.prototype.set = function(group, entity) {};

    GroupManager.prototype.get = function(group) {};

    GroupManager.prototype.remove = function(entity) {};

    return GroupManager;

  })();

  Bragi.GroupManager = GroupManager;

}).call(this);

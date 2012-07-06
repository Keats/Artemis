// Generated by CoffeeScript 1.3.3
(function() {
  var GroupManager;

  Bragi.GroupManager = {};

  GroupManager = (function() {

    function GroupManager(world) {
      this.world = world;
      this.entitiesByGroup = {};
      this.groupByEntity = {};
    }

    GroupManager.prototype.set = function(group, entity) {
      var entities;
      this.remove(entity);
      entities = this.entitiesByGroup[group];
      if (!entities) {
        entities = [];
        this.entitiesByGroup[group] = entities;
      }
      entities.push(entity);
      return this.groupByEntity[entity.id] = group;
    };

    GroupManager.prototype.get = function(group) {
      return this.entitiesByGroup[group];
    };

    GroupManager.prototype.remove = function(entity) {
      var entities, group, index;
      if (entity.id in this.groupByEntity) {
        group = this.groupByEntity[entity.id];
        delete this.groupByEntity[entity.id];
        entities = this.entitiesByGroup[group];
        if (entities) {
          index = entities.indexOf(entity);
          entities.splice(index, 1);
          if (entities.length === 0) {
            return delete this.entitiesByGroup[group];
          }
        }
      }
    };

    return GroupManager;

  })();

  Bragi.GroupManager = GroupManager;

}).call(this);

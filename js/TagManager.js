// Generated by CoffeeScript 1.3.3
(function() {
  var TagManager;

  Artemis.TagManager = {};

  TagManager = (function() {

    function TagManager(world) {
      this.world = world;
      this.taggedEntities = {};
    }

    TagManager.prototype.register = function(tag, entity) {
      this.taggedEntities[tag] = entity;
      return null;
    };

    TagManager.prototype.unregister = function(tag) {
      return delete this.taggedEntities[tag];
    };

    TagManager.prototype.get = function(tag) {
      return this.taggedEntities[tag];
    };

    TagManager.prototype.isRegistered = function(tag) {
      return tag in this.taggedEntities;
    };

    return TagManager;

  })();

  Artemis.TagManager = TagManager;

}).call(this);

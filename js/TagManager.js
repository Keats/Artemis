(function() {
  var TagManager;

  Bragi.TagManager = {};

  TagManager = (function() {

    function TagManager(world) {
      this.world = world;
      this.taggedEntities = {};
    }

    TagManager.prototype.add = function(tag, entity) {};

    TagManager.prototype.remove = function(tag) {};

    TagManager.prototype.get = function(tag) {};

    return TagManager;

  })();

  Bragi.TagManager = TagManager;

}).call(this);

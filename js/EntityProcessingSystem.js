// Generated by CoffeeScript 1.3.3
(function() {
  var EntityProcessingSystem,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  Artemis.EntityProcessingSystem = {};

  EntityProcessingSystem = (function(_super) {

    __extends(EntityProcessingSystem, _super);

    function EntityProcessingSystem() {
      return EntityProcessingSystem.__super__.constructor.apply(this, arguments);
    }

    EntityProcessingSystem.prototype.construct = function() {
      return EntityProcessingSystem.__super__.construct.apply(this, arguments);
    };

    EntityProcessingSystem.prototype.processEntity = function(entity) {};

    EntityProcessingSystem.prototype.processEntities = function(entities) {
      var entity, index, _results;
      _results = [];
      for (index in entities) {
        entity = entities[index];
        _results.push(this.processEntity(entity));
      }
      return _results;
    };

    return EntityProcessingSystem;

  })(Artemis.System);

  Artemis.EntityProcessingSystem = EntityProcessingSystem;

}).call(this);

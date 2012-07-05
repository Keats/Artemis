// Generated by CoffeeScript 1.3.3
(function() {
  var DummySystemHP,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  window.BragiTests.DummySystemHP = {};

  DummySystemHP = (function(_super) {

    __extends(DummySystemHP, _super);

    function DummySystemHP() {
      DummySystemHP.__super__.constructor.call(this, "DummyComponentHP");
    }

    DummySystemHP.prototype.initialize = function() {
      return this.dummyComponentHPMapper = new Bragi.ComponentMapper("DummyComponentHP", this.world);
    };

    DummySystemHP.prototype.process = function(entity) {
      var dummyComponentHP;
      dummyComponentHP = this.dummyComponentHPMapper.get(entity);
      return dummyComponentHP.hp = 0;
    };

    return DummySystemHP;

  })(Bragi.EntityProcessingSystem);

  window.BragiTests.DummySystemHP = DummySystemHP;

}).call(this);

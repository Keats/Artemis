
window.BragiTests = {}

window.BragiTests.DummyComponentHP = {}
window.BragiTests.DummyComponentPosition = {}
window.BragiTests.DummyComponentVelocity = {}
window.BragiTests.DummyComponentName = {}

class DummyComponentHP extends Bragi.Component

  constructor: (@hp) ->



class DummyComponentPosition extends Bragi.Component

  constructor: (@x, @y, @z) ->



class DummyComponentVelocity extends Bragi.Component

  constructor: (@velocity, @angle) ->



class DummyComponentName extends Bragi.Component

  constructor: (@name) ->


window.BragiTests.DummyComponentHP = DummyComponentHP
window.BragiTests.DummyComponentPosition = DummyComponentPosition
window.BragiTests.DummyComponentVelocity = DummyComponentVelocity
window.BragiTests.DummyComponentName = DummyComponentName
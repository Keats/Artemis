
window.ArtemisTests = {}

window.ArtemisTests.DummyComponentHP = {}
window.ArtemisTests.DummyComponentPosition = {}
window.ArtemisTests.DummyComponentVelocity = {}
window.ArtemisTests.DummyComponentName = {}

class DummyComponentHP extends Artemis.Component

  constructor: (@hp) ->



class DummyComponentPosition extends Artemis.Component

  constructor: (@x, @y, @z) ->



class DummyComponentVelocity extends Artemis.Component

  constructor: (@velocity, @angle) ->



class DummyComponentName extends Artemis.Component

  constructor: (@name) ->


window.ArtemisTests.DummyComponentHP = DummyComponentHP
window.ArtemisTests.DummyComponentPosition = DummyComponentPosition
window.ArtemisTests.DummyComponentVelocity = DummyComponentVelocity
window.ArtemisTests.DummyComponentName = DummyComponentName
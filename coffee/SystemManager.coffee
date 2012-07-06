
Bragi.SystemManager = {}


# Handles all the systems
class SystemManager

  _systemBits = {}
  _pos = 0


  constructor: (world) ->
    @world = world
    #List of systems by type
    @systems = {}
    #An array of all the systems
    @allSystems = []
    
    
  #Replaces the SystemBitManager
  #Stores a reference to a system as a bit
  _getBitFor: (system) ->
    bit = _systemBits[system]
    if not bit
      bit = 1 << _pos
      _pos += 1
      _systemBits[system] = bit

    bit


  #Adds a system
  addSystem: (system) ->
    system.world = @world
    
    @systems[system.constructor.name] = system

    if system not in @allSystems
      @allSystems.push system

    system.bit = @_getBitFor system.constructor.name


  #TODO change that, right now using string as type
  getSystem: (type) ->
    @systems[type]


  #Initialize all the systems added
  initializeAll: () ->
    for system in @allSystems
      system.initialize()



Bragi.SystemManager = SystemManager
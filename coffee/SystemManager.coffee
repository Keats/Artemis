
Artemis.SystemManager = {}


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

    #Maybe later join this in an array of 2 objects
    @updateSystems = {}
    @renderSystems = {}
    
    
  #Replaces the SystemBitManager
  #Stores a reference to a system as a bit
  _getBitFor: (system) ->
    bit = _systemBits[system]
    if not bit
      bit = 1 << _pos
      _pos += 1
      _systemBits[system] = bit

    bit


  #Adds a system, execType is either update or render, priority allows to group some operations
  # and ensure that some are finished before doing others, 0 is done first and so on
  addSystem: (system, execType, priority = 0) ->
    if execType isnt "update" and execType isnt "draw" 
      throw "Invalid type when adding a system: it can only be the string update or draw"

    #adding the world variable since we need to have it later
    system.world = @world

    #A system is basically a singleton
    @systems[system.constructor.name] = system
    #Next adding to distinct update or render objects
    if execType is "update"
      unless @updateSystems[priority]
        @updateSystems[priority] = []
      @updateSystems[priority].push system

    else if execType is "draw"
      unless @renderSystems[priority]
        @renderSystems[priority] = []
      @renderSystems[priority].push system

    #And we keep an array of all those systems
    if system not in @allSystems
      @allSystems.push system

    system.bit = @_getBitFor system.constructor.name
    
    system


  #TODO change that, right now using string as type
  getSystem: (type) ->
    @systems[type]


  #Initialize all the systems added
  initializeAll: () ->
    for system in @allSystems
      system.initialize()


  #Updates all system for a give execType
  updateSynchronous: (execType) ->
    if execType is "update"
      #do update
      for priority of @updateSystems
        @updateArraySynchronous @updateSystems[priority]
    else if execType is "draw"
      for priority of @renderSystems
        @updateArraySynchronous @renderSystems[priority]
    else
      throw "Invalid type when trying to update: it can only be the string update or draw"


  #Really update the systems given
  updateArraySynchronous:(systems) ->
    for system in systems
      system.process()



Artemis.SystemManager = SystemManager
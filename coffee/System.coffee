
Artemis.System = {}


class System

  constructor: (components...) ->
    @world = null
    #The active components associated
    @actives = {}
    #Should the system be processed ?
    @enabled = true
    #Identifying the type of the system
    @bit = 0
    #Identifying the components associated
    @typeFlags = 0

    for component in components
      #TODO: change that when coffeescript gives name of class
      type = Artemis.ComponentTypeManager.getTypeByName component
      @typeFlags |= type.bit


  initialize: () ->
    #TO OVERRIDE
    #called when creating a system to setup some values (by children classes) 


  processEntities: (entities) ->
    #TO OVERRIDE
    #implement method and logic for entities here


  #If you want to add some logic before processing entities
  begin: () ->
    #TO OVERRIDE


  #If you want to add some logic after processing entities or clean up
  end: () ->
    #TO OVERRIDE

  #General method for processing 
  process: () ->
    if @enabled
      @begin
      @processEntities @actives
      @end


  change: (entity) ->
    #First we check if the system bit is in the bits from the entity
    contains = (@bit & entity.systemBits) == @systemBit
    #And now we check if the component is used by this system
    interest = (@typeFlags & entity.typeBits) == @typeFlags
    
    #If the system is interested in this component but this entity is not registered
    if interest and not contains and @typeFlags > 0
      @actives[entity.id] = entity
      entity._addSystemBit @bit
      @added entity
    #If it doesn't the component, we remove it
    else if not interest and contains and @typeFlags > 0
      @remove entity


  remove: (entity) ->
    delete @actives[entity.id]
    entity._removeSystemBit @bit
    @removed entity



  added: (entity) ->
    #TO OVERRIDE
    #called when adding an entity

  removed: (entity) ->
    #TO OVERRIDE
    #called when removing an entity


Artemis.System = System
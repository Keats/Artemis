
Bragi.SystemManager = {}


# Handles all the systems
class SystemManager


  construct: (@world) ->
    #Maybe have a map with className, object so we could retrieve all the systems by class name 
    #Also just an array of all the systems
    

  addSystem: (system) ->
    #Adds a system
    #gives the @world attribute to the system


  getSystems: () ->
    #returns all the systems



Bragi.SystemManager = SystemManager
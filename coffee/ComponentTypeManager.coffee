
Bragi.ComponentTypeManager = {}


#Class storing references to the different components so we can use them in systems
class ComponentTypeManager

  #Holds the references for the uniqueId and componentId
  _componentTypes = {}

  #Gets or create a ComponentType based on the class name and adds it the _componentTypes
  @getType: (component) ->

    unless component instanceof Bragi.Component
      throw new Error "Tried to add a component that is not inheriting from Component"

    #TODO change that when coffeescript gives a name property to classes
    className = component.constructor.name

    #First we try to find out if we already have an instance of this component
    type = _componentTypes[className]

    #If not we create a new component type and add it to the object _componentTypes
    if not type
      type = new Bragi.ComponentType()
      _componentTypes[className] = type

    type


  @getId: (component) ->
    @getType(component).id


  @getBit: (component) ->
    @getType(component).bit


Bragi.ComponentTypeManager = ComponentTypeManager
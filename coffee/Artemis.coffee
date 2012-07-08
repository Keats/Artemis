
root = this

original_Artemis = root.Artemis
Artemis = undefined


if typeof exports isnt "undefined"
  Artemis = exports
else
  Artemis = original_Artemis = {}
  root.Artemis = Artemis


Artemis.VERSION = "0.0.1"
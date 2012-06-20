
root = this

original_bragi = root.Bragi
Bragi = undefined


if typeof exports isnt "undefined"
  Bragi = exports
else
  Bragi = original_bragi = {}
  root.Bragi = Bragi


Bragi.VERSION = "0.0.1"
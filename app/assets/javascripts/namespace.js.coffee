namespace = (target, name, block) ->
  if arguments.length < 3
    [target, name, block] = [(exports ? window), arguments...]
  top    = target
  target = target[item] ?= {} for item in name.split '.'
  block target, top

# Make global
window.namespace = namespace


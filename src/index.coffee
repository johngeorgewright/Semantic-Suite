{EventEmitter} = require 'events'
Features = require './features'
require 'colors'

emitter = new EventEmitter()

emitter.on 'feature', (feature) ->
  console.log feature.yellow

emitter.on 'pass', (message) ->
  console.log "\t" + message.green

emitter.on 'fail', (message) ->
  console.log "\t" + message.red

String::features = (scenarios) ->
  features = new Features @toString(), emitter, global
  features.registerScenarios scenarios
  features.run()


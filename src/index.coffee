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

String::features = (procedure) ->
  features = Features.factory @toString(), procedure, emitter, global
  features.run()


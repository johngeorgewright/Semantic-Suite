{EventEmitter} = require 'events'
Scenario = require './scenario'
require 'colors'

emitter = new EventEmitter()

emitter.on 'feature', (feature) ->
  console.log feature.yellow

emitter.on 'pass', (message) ->
  console.log "\t" + message.green

emitter.on 'fail', (message) ->
  console.log "\t" + message.red

String::features = (procedure) ->
  global.Scenario = (steps) ->
    scenario = Scenario.factory steps, emitter
    scenario.run()
  global.expect = require('chai').expect
  emitter.emit 'feature', @toString() + ' features'
  procedure()
  delete global.expect


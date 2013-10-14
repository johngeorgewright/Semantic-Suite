{EventEmitter} = require 'hap'
Scenario = require './scenario'
emitter = new EventEmitter()
require 'colors'

global.Scenario = (steps) -> Scenario.factory steps
global.expect = require('chai').expect

emitter.on 'pass', (e) ->
  console.log "\t" + e.val().green

emitter.on 'fail', (e) ->
  console.log "\t" + e.val().red

String::features = (procedure) ->
  console.log "#{@toString()} features".green
  procedure()


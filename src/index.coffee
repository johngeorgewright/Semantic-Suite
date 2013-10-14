{EventEmitter} = require 'hap'
exports.emitter = emitter = new EventEmitter()
require 'colors'

GIVEN = 'Given'
WHEN  = 'When'
THEN  = 'Then'
AND   = 'And'

valueAsString = (value) ->
  switch typeof value
    when 'string' then "\"#{value}\""
    when 'function' then value.toString().replace(/\s{2,}/g, ' ').replace('function () { return ', '').replace(/; \}$/, '')
    when 'object' then JSON.stringify value
    else value

class ScenarioRunner
  constructor: (@context) ->
    @currentStepType = null
    @emitter = new EventEmitter()
    @emitter.setParent emitter

  creation: (name, fn) ->
    @currentStepType = GIVEN
    if fn
      value = undefined
      @context[name] = =>
        if typeof value is 'undefined'
          value = fn.call @context
          @emitter.onceBefore 'pass', (e) -> e.val "Given #{name} -> #{valueAsString value}"
          @emitter.fire 'pass'
        value
    else
      @procedure name, GIVEN

  procedure: (procedure, stepType) ->
    @currentStepType = stepType
    log = "#{stepType} -> #{valueAsString procedure}"
    try
      procedure.call @context
      type = 'pass'
    catch e
      type = 'fail'
      log += "\n#{e.message}"
    @emitter.onceBefore type, (e) -> e.val log
    @emitter.fire type

  again: ->
    switch @currentStepType
      when GIVEN then @creation.apply this, arguments
      when WHEN then @procedure.call this, arguments[0], WHEN
      when THEN then @procedure.call this, arguments[0], THEN

global.Scenario = (scenario) ->
  runner        = new ScenarioRunner global
  global[WHEN]  = (procedure) -> runner.procedure procedure, WHEN
  global[THEN]  = (procedure) -> runner.procedure procedure, THEN
  global[AND]   = runner.again.bind runner
  global[GIVEN] = (name, fn) -> runner.creation name, fn
  scenario.call runner.context
  for stepType in [GIVEN, WHEN, AND, THEN]
    delete global[stepType]

global.expect = require('chai').expect

emitter.on 'pass', (e) ->
  console.log "\t" + e.val().green

emitter.on 'fail', (e) ->
  console.log "\t" + e.val().red

String::features = (procedure) ->
  console.log "#{@toString()} features".green
  procedure()


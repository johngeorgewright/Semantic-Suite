class Features
  constructor: (@name, @emitter, @context) ->
    @scenarios = []

  registerScenario: (procedure) ->
    @scenarios.push Scenario.factory(procedure, @emitter, @context)

  run: ->
    @emitter.emit 'feature', @name + ' features'
    scenario.run() for scenario in @scenarios

  @factory: (name, procedure, emitter, context) ->
    features = new Features name, emitter, context
    context.Scenario = features.registerScenario.bind features
    context.expect = require('chai').expect
    procedure.call context
    delete global.expect
    delete context.Scenario
    features

module.exports = Features
Scenario = require './scenario'


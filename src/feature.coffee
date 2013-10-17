class Feature
  constructor: (@name, @emitter, @context) ->
    @scenarios = []

  registerScenario: (steps) ->
    scenario = new Scenario @emitter, @context
    scenario.registerSteps steps
    @scenarios.push scenario

  registerScenarios: (scenarios) ->
    @context.Scenario = @registerScenario.bind this
    @context.expect = chai
    scenarios()
    delete @context.Scenario
    delete @context.expect

  run: ->
    @emitter.emit 'feature', @name + ' features'
    scenario.run() for scenario in @scenarios

module.exports = Feature
Scenario = require './scenario'
{chai} = require 'chai'


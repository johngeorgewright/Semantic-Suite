class Feature
  constructor: (@name, @emitter, @context) ->
    @backgroundSteps = ->
    @scenarios = []

  registerBackground: (steps) ->
    @backgroundSteps = steps

  registerScenario: (steps) ->
    scenario = new Scenario @emitter, @context
    scenario.registerSteps @backgroundSteps
    scenario.registerSteps steps
    @scenarios.push scenario

  registerScenarios: (scenarios) ->
    @context.Background = @registerBackground.bind this
    @context.Scenario = @registerScenario.bind this
    scenarios()
    delete @context.Background
    delete @context.Scenario

  run: ->
    @emitter.emit 'feature', @name + ' features'
    scenario.run() for scenario in @scenarios

module.exports = Feature
Scenario = require './scenario'


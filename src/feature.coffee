class Feature
  constructor: (@name, @emitter, @context) ->
    @backgroundSteps = ->
    @scenarios = []

  registerBackground: (steps) ->
    @backgroundSteps = steps

  registerScenario: (name, steps) ->
    scenario = new Scenario name, @emitter, @context
    scenario.registerSteps @backgroundSteps
    scenario.registerSteps steps
    @scenarios.push scenario

  registerScenarios: (scenarios) ->
    _this = this
    @context.Background = @registerBackground.bind this
    @context.Scenario = (steps) -> _this.registerScenario null, steps
    String::scenario = (steps) -> _this.registerScenario @toString(), steps
    scenarios()
    delete @context.Background
    delete @context.Scenario

  run: ->
    @emitter.emit 'feature', name: "#{@name} feature"
    scenario.run() for scenario in @scenarios

module.exports = Feature
Scenario = require './scenario'


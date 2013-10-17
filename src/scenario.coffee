class Scenario
  constructor: (@context, @emitter) ->
    @currentStepType = null
    @steps = []
    @cancelled = no
    @emitter.on 'fail', @finish.bind this

  registerProcedure: (type, step) ->
    @currentStepType = type
    step = new Procedure type, step, @context, @emitter
    @steps.push step

  registerCreation: (name, step) ->
    @currentStepType = Scenario.GIVEN
    if step
      @steps.push new Creation name, step, @context, @emitter
    else
      @registerProcedure Scenario.GIVEN, name

  registerAnother: ->
    switch @currentStepType
      when Scenario.GIVEN then @registerCreation.apply this, arguments
      else @registerProcedure.call this, @currentStepType, arguments[0]

  run: ->
    @each (step) -> step.run()

  each: (fn) ->
    for step in @steps
      break if @cancelled
      fn step

  finish: ->
    @cancelled = yes

  @valueAsString: (value) ->
    switch typeof value
      when 'string' then "\"#{value}\""
      when 'function' then value.toString().replace(/\s{2,}/g, ' ').replace('function () { return ', '').replace(/; \}$/, '')
      when 'object' then JSON.stringify value
      else value

  @factory: (steps, emitter, context=global) ->
    scenario                = new Scenario context, emitter
    context[Scenario.WHEN]  = (procedure) -> scenario.registerProcedure Scenario.WHEN, procedure
    context[Scenario.THEN]  = (procedure) -> scenario.registerProcedure Scenario.THEN, procedure
    context[Scenario.AND]   = scenario.registerAnother.bind scenario
    context[Scenario.GIVEN] = (name, fn) -> scenario.registerCreation name, fn
    steps.call context
    for stepType in [Scenario.GIVEN, Scenario.WHEN, Scenario.AND, Scenario.THEN]
      delete context[stepType]
    scenario

  @GIVEN: 'Given'
  @WHEN: 'When'
  @THEN: 'Then'
  @AND: 'And'

module.exports = Scenario
{Procedure, Creation} = require './step'


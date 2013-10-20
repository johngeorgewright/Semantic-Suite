class Scenario
  constructor: (@emitter, @context) ->
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

  registerSteps: (steps) ->
    @context[Scenario.WHEN]  = (procedure) => @registerProcedure Scenario.WHEN, procedure
    @context[Scenario.THEN]  = (procedure) => @registerProcedure Scenario.THEN, procedure
    @context[Scenario.AND]   = @registerAnother.bind this
    @context[Scenario.GIVEN] = (name, fn) => @registerCreation name, fn
    steps()
    for stepType in [Scenario.GIVEN, Scenario.WHEN, Scenario.AND, Scenario.THEN]
      delete @context[stepType]

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
      when 'object' then JSON.stringify value
      when 'function'
        value
          .toString()
          .replace(/\s{2,}/g, ' ')
          .replace(///
            function \s* \( [^\)]* \) \s* \{
              \s*return\s*
          ///, '')
          .replace(/;\s*\}$/, '')
      else value

  @GIVEN: 'Given'
  @WHEN: 'When'
  @THEN: 'Then'
  @AND: 'And'

module.exports = Scenario
{Procedure, Creation} = require './step'


class Procedure
  constructor: (@type, @fn, @context, @emitter) ->
    @description = "#{@type} -> #{Scenario.valueAsString @fn}"

  run: ->
    log = @description
    try
      @fn.call @context
      type = 'pass'
    catch e
      type = 'fail'
      log += "\n#{e.message}"
    @emitter.emit type, log

class Creation
  constructor: (@name, @fn, @context, @emitter) ->

  run: ->
    value = undefined
    @context[name] = =>
      if typeof value is 'undefined'
        value = fn.call @context
        @emitter.emit 'pass', "Given #{name} -> #{Scenario.valueAsString value}"
      value

exports.Procedure = Procedure
exports.Creation  = Creation

Scenario = require './scenario'

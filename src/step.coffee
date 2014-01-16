valueAsString = (value) ->
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

class Procedure
  constructor: (@type, @fn, @context, @emitter) ->
    @description = "#{type} -> #{valueAsString fn}"

  run: ->
    log = @description
    try
      @fn.call @context
      @emitter.emit 'pass', message: log, type: "procedure"
    catch e
      log += "\n#{e.message}"
      @emitter.emit 'fail',
        message: log
        error: e

class Creation
  constructor: (@name, @fn, @context, @emitter) ->

  run: ->
    value = undefined
    @emitter.emit 'pass',
      message: "Given #{@name} -> #{valueAsString @fn}"
      type: "creation"
    @context[@name] = =>
      if typeof value is 'undefined'
        value = @fn.call @context
      value

exports.Procedure = Procedure
exports.Creation  = Creation


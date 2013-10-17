class Suite
  constructor: (@context) ->
    @emitter = new EventEmitter()
    _this = this
    String::features = (scenarios) ->
      _this.feature @toString(), scenarios

  feature: (name, scenarios) ->
    features = new Feature name, @emitter, @context
    features.registerScenarios scenarios
    features.run()

  use: (listener) ->
    listener @emitter

module.exports = Suite
{EventEmitter} = require 'events'
Feature = require './feature'


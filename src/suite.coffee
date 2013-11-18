class Suite
  constructor: (@context) ->
    @emitter = new EventEmitter()
    @features = []
    _this = this
    String::feature = (scenarios) ->
      _this.registerFeature @toString(), scenarios

  deconstruct: ->
    delete String::feature

  registerFeature: (name, scenarios) ->
    feature = new Feature name, @emitter, @context
    feature.registerScenarios scenarios
    @features.push feature

  run: ->
    @emitter.emit 'suite'
    feature.run() for feature in @features

  use: (listener) ->
    listener @emitter

module.exports = Suite
{EventEmitter} = require 'events'
Feature = require './feature'


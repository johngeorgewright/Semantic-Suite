require 'colors'

module.exports = (emitter) ->
  emitter.on 'feature', (feature) ->
    console.log feature.yellow

  emitter.on 'pass', (message) ->
    console.log "\t" + message.green

  emitter.on 'fail', (message) ->
    console.log "\t" + message.red


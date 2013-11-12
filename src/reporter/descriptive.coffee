require 'colors'

module.exports = (emitter) ->
  emitter.on 'feature', (args) ->
    console.log args.name.yellow

  emitter.on 'scenario', (args) ->
    name = if args.name then "#{args.name} scenario" else "Scenario"
    console.log "\t#{name}".yellow

  emitter.on 'pass', (args) ->
    console.log "\t\t" + args.message.green

  emitter.on 'fail', (args) ->
    console.log "\t\t" + args.message.red


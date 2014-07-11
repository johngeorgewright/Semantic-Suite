require "colors"

module.exports = (emitter) ->
  failed = []

  emitter.on "feature", (details) ->
    console.log details.name.yellow

  emitter.on "feature end", ->
    console.log ""

  emitter.on "pass", (details) ->
    process.stdout.write ".".green if details.type is "procedure"

  emitter.on "fail", (details) ->
    failed.push details.message
    process.stdout.write ".".red

  emitter.on "scenario end", ->
    for message in failed
      console.log ""
      console.log message.red


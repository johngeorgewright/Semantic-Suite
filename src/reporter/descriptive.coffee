require 'colors'

PADDING   = 5
MAX_WIDTH = process.stdout.columns - PADDING
ENDING    = '...'

process.stdout.on 'resize', ->
  MAX_WIDTH = process.stdout.columns - PADDING

trim = (str) ->
  w = MAX_WIDTH
  colourRegExp = /\x1b\[\d+m/g
  while foundColour = colourRegExp.exec str
    w += foundColour[0].length
  if str.length > w
    str = str.substr 0, w - ENDING.length
    str += ENDING
  str

log = (str) ->
  console.log trim str

module.exports = (emitter) ->
  emitter.on 'feature', (details) ->
    log details.name.yellow

  emitter.on 'feature end', ->
    log ''

  emitter.on 'scenario', (details) ->
    str = if details.name then "#{details.name} scenario" else 'Scenario'
    log ''
    log "    #{str}".yellow

  emitter.on 'pass', (details) ->
    log "        " + details.message.green

  emitter.on 'fail', (details) ->
    log "        " + details.message.red


class Calculator
  constructor: ->
    @left = null
    @right = null
    @total = null

  add: ->
    @total = @left + @right

module.exports = Calculator


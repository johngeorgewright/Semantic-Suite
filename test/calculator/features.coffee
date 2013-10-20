Calculator = require './calculator'
{expect} = require 'chai'

"Calculator".features ->
  Scenario ->
    Given 'calculator', -> new Calculator()
    And -> calculator().left = 50
    And -> calculator().right = 70
    When -> calculator().add()
    Then -> expect(calculator().total).to.equal 120


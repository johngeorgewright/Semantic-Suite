Calculator = require '../calculator/calculator'
{expect} = require 'chai'

"Background".features ->
  Background ->
    Given 'calculator', -> new Calculator()

  Scenario ->
    Then -> expect(calculator()).to.be.instanceOf Calculator

  Scenario ->
    Given -> calculator().left = 50
    And   -> calculator().right = 70
    When  -> calculator().add()
    Then  -> expect(calculator().total).to.equal 120


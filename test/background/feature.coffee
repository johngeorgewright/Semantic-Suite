Calculator = require '../calculator/calculator'
{expect} = require 'chai'

"Background".feature ->
  Background ->
    Given 'calculator', -> new Calculator()

  "Instantiation".scenario ->
    Then -> expect(calculator()).to.be.instanceOf Calculator

  "Adding".scenario ->
    Given -> calculator().left = 50
    And   -> calculator().right = 70
    When  -> calculator().add()
    Then  -> expect(calculator().total).to.equal 120


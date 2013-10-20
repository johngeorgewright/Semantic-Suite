Calculator = require '../calculator/calculator'
{expect} = require 'chai'

"Background".features ->
  Background ->
    Given 'calculator', -> new Calculator()

  Scenario ->
    Then -> expect(calculator()).to.be.instanceOf Calculator


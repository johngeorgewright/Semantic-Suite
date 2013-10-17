Suite = require '../../'
Calculator = require './calculator'
suite = new Suite global

suite.use require '../../build/output/descriptive'

"Calculator".features ->

  Scenario ->
    Given 'calculator', -> new Calculator()
    And -> calculator().left = 50
    And -> calculator().right = 70
    When -> calculator().add()
    Then -> expect(calculator().total).to.equal 121


{expect} = require 'chai'

'Hyphenated'.feature ->
  Scenario ->
    Given 'something-hyphenated', -> 'camelcase'
    Then -> expect(somethingHyphenated()).to.equal 'camelcase'


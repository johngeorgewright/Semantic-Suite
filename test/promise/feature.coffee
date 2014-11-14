chai = require 'chai'
{expect} = chai
asPromised = require 'chai-as-promised'
Promise = require 'bluebird'
chai.use asPromised

'Promised'.feature ->
  Scenario ->
    Given 'promise', -> new Promise (res)-> setTimeout (-> res 'mung'), 200
    Then -> expect(promise()).to.eventually.equal 'mung'


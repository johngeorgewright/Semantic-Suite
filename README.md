Semantic Suite *alpha*
======================

This **will** be a semantic style testing suite for JavaScript and then
eventually other languages.

Why make yet another testing suite?
-----------------------------------

Good point... why bother. There are some great testing suites out there already
and there might not be much difference. The only difference I'm putting forward
is less code and a more readable interface.

Let's take the old "calculator" example. (I'll first write these examples in
CoffeeScript as it's makes Semantic Suite look even better).

Here's the example using the Jasmine testing suite:

```coffee
describe "Calculator", ->

  calculator = null

  beforeEach ->
    calculator = new Calculator()

  describe ".add()", ->

    beforeEach ->
      calculator.left = 50
      calculator.right = 70
      calculator.add()

    it "will sum the 2 numbers", ->
      expect(calculator.total).toBe 120
```

Although the above example is fine and dandy, I feel I'm always repeating
myself. If the test is written well enough you shouldn't need to describe 
everything. Here's my proposal for Semantic Suite:

```coffee
"Calculator".features ->
  Scenario ->
    Given 'calculator', -> new Calculator()
    When -> calculator().left = 50
    And -> calculator().right = 70
    And -> calculator().add()
    Then -> expect(calculator().total).to.be 120
```

If you've used any testing suite with "Gherkin" syntax, or used something like
"RSpec" you may notice some influence.

Here's the same example written in plain JavaScript. It's not quite as nice,
but it still seems pretty readable:

```javascript
"Calculator".features(function () {
  Scenario(function () {
    Given('calculator', function () { return new Calculator(); });
    When(function () { calculator().left = 50; });
    And(function () { calculator().right = 70; });
    And(function () { calculator().add(); });
    Then(function () { expect(calculator().total).to.be(120); });
  });
});
```

Installation
------------

1. Install Node.js
2. Clone this repo.
3. `[sudo] npm link`

Using
-----

1. Create a directory somewhere to write some tests.
2. `sems my-directory/some-test.js` (leaving the extension off of the file name).


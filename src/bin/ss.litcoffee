The Semantic Suite CLI Tool
===========================

Requirements
------------

    program = require 'commander'
    path = require 'path'
    pkg = require '../../package.json'

Specifying the options
----------------------

We'll use the version specified in the package.json.

    program.version pkg.version

We'll re-write the usage so specify that arguments (file paths) are required.

    program.usage('[options] <file ...>')

Reporters can be specified with the "-r" option.

    program
      .option('-r, --reporter <reporter>')
      .parse(process.argv)

Validation
----------

The only requirement is to specify at least one file path.

    program.help() unless program.args.length > 0

The reporter will be optional, and default to the "descriptive" reporter.

    program.reporter ?= 'descriptive'

Running the suite
-----------------

The suite will add methods to the global scope.

    Suite = require '../'
    suite = new Suite global
    suite.use require '../../build/reporter/' + program.reporter

    for file in program.args
      require path.resolve file


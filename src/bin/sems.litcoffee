The Semantic Suite CLI Tool
===========================

Requirements
------------

The CLI tool requires the "commander" package.

    fs = require 'fs'
    program = require 'commander'
    path = require 'path'
    pkg = require '../../package.json'
    requireDirectory = require 'require-directory'

It can automatically compile CoffeeScript files.

    try
      require 'coffee-script'
    catch e

Options
-------

We'll use the version specified in the package.json.

    program.version pkg.version

We'll re-write the usage so specify that arguments (file paths) are required.

    program.usage '[options] <file|dir ...>'

Reporters can be specified with the "-r" option.

    program.option '-r, --reporter <reporter>'

Validation
----------

The only requirement is to specify at least one file path.

    program.parse process.argv
    program.help() unless program.args.length > 0

The reporter will be optional, and default to the "descriptive" reporter.

    program.reporter ?= 'descriptive'

Running the suite
-----------------

    sems = require '../'
    Suite = sems.Suite

The suite will add methods to the global scope.

    suite = new Suite global

Add a configured reported.

    suite.use sems.reporter[program.reporter]

The passed files will be included in to this script.

    for file in program.args
      resolvedPath = path.resolve file
      if fs.lstatSync(resolvedPath).isDirectory()
        requireDirectory module, resolvedPath
      else
        require resolvedPath

And then the test suite is run.

    suite.run()
    suite.deconstruct()


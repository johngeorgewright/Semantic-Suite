requireDirectory = require 'require-directory'
path = require 'path'

ucwords = (str) ->
  wordSeparation = /^([a-z\u00E0-\u00FC])|\s+([a-z\u00E0-\u00FC])/g
  newStr = "#{str} ".replace wordSeparation, ($1) -> $1.toUpperCase()
  newStr.trim()

attach = (fullPath) ->
  baseName = path.basename fullPath, path.extname fullPath
  if /^\./.test(baseName) or /bin\//.test(fullPath)
    no
  else if /reporter\//.test fullPath
    yes
  else
    className = ucwords baseName
    module.exports[className] = require fullPath
    no

for key, value of requireDirectory(module, __dirname, attach)
  module.exports[key] = value


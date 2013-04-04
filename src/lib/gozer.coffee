###
  Gozer - A load tester
  
  @author Bheesham Peraud <bheesham.persaud@live.ca>
###

fs = require("fs")
yaml = require("js-yaml")
cli = require("cli-color")
phantom = require('phantom-proxy');

exports.log = (msg, type) -> 
  if type is "error"
    console.log(cli.red("ERROR: ") + msg)
  else if type is "success"
    console.log(cli.green("SUCCESS: ") + msg)
  else
    console.log(msg)

exports.config = (file) ->
  if !fs.existsSync(file) or !fs.statSync(file).isFile()
    exports.log("Speficied configuration could not be found.", "error")
    process.exit(1)
  return yaml.safeLoad(fs.readFileSync(file).toString())

exports.taunt = (duration, config) ->
  phantom.create(
    ignoreSslErrors: yes
    diskCache: no
    loadImages: yes
    maxDiskCache: 0
  , taunt);

taunt = (proxy) ->
  exports.log("boo!")

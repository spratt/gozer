###
  Gozer - A load tester
  
  @author Bheesham Peraud <bheesham.persaud@live.ca>
###

gozer = require("../lib/gozer");

if process.argv.length is 1
  gozer.log("Unspecified configuration file.", "error")
  process.exit(1)

config = gozer.config(process.argv[2])

# Taunt that page for that long
for page in config.pages
  gozer.taunt(config.duration, page)

# Make sure we exit at the appropriate time
setTimeout(() ->
  gozer.log("Exiting", "success")
  process.exit(0)
, config.duration * 1000)
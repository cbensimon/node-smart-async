# node-simple-then
A light Node module for asynchronous javascript

```coffeescript
print = console.log 
async = require 'simple-then'

async [
	->
		print 'f1'
		setTimeout @_then(), 500
		
	->
		print 'requesting google...'
		@url = 'http://google.fr'	# You can use this to communicate between functions
		request @url, @_then()

	(err, res, body) ->
		@_error err	# Will call the end function only if err contains something
		print "#{@url} has arrived"
		@_end 'arg1', 'arg2'	# As many as you want

], (err, arg1, arg2) ->	# Optional if you don't call @_error or @_end
	throw err if err
	print arg1, arg2

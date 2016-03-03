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
		@url = 'http://google.fr'	# You can use this to communicate between functions
		request @url, @_then()
		print 'requesting google...'

	(err, res, body) ->
		print "#{@url} has arrived"
		@_error err					# Will call the end function only if err contains something
		@_end 'arg1', 'arg2'		# As many as you want

], (err, arg1, arg2) ->				# Optional if you don't call @_error or @_end
	throw err if err
	print arg1, arg2

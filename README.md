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
		print 'f2'
		@name = 'Charles'
		setTimeout @_then(), 500

	->
		print 'f3'
		@_error new Error() unless @name == 'Charles'
		@_end 'arg1', 'arg2'	# As many as you want

], (err, arg1, arg2) ->	# Optional if you don't call @_error or @_end
	throw err if err
	print arg1, arg2

# node-simple-then
A light Node module for asynchronous javascript

```coffeescript
print = console.log 
async = require 'simple-then'

async [
	->
		print 'f1'
		@name = 'Charles'
		setTimeout @_then(), 500
		
	->
		print 'f2'
		print @name
		if @name !== 'Charles'
		  @_error new Error 'Error from f2'
		setTimeout @_then(), 500

	->
		print 'f3'
		@_last 'arg1', 'arg2'

], (err, arg1, arg2) ->
	throw err if err
	print arg1, arg2

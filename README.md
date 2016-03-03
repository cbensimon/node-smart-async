# node-smart-async
A light Node module for asynchronous javascript

```js
var async = require('smart-async')
var request = require('request')

async([
	function() {
		setTimeout(this._then(), 500);
		console.log('Will perform a request in 500ms...')
	},
	function() {
		this.url = 'http://google.fr'           // You can use 'this' to communicate between functions
		request(this.url, this._then())
		console.log('requesting google...')
	},
	function (err, res, body) {
		console.log(this.url + " has arrived")
		this._error(err)			            // Will call the end function only if 'err' contains something
		this._end('arg1', 'arg2')	            // As many as you want
	}
], function(err, arg1, arg2) {				    // Optional if you don't call @_error or @_end
	if err throw err
	console.log(arg1, arg2)
})
```

Coffeescript
```coffeescript
print = console.log 
async = require 'smart-async'

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
```

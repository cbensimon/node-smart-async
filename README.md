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
	  // You can use 'this' to communicate between functions
	  this.url = 'http://google.fr'
	  request(this.url, this._then())
	  console.log('requesting google...')
    },
    function (err, res, body) {
	  console.log(this.url + " has arrived")
	  // Will call the end function only if 'err' contains something
	  this._error(err)
	  // You can call the end function with as many arguments as you want
	  this._end('arg1', 'arg2')
    }
// End function : only if you call @_error or @_end
], function(err, arg1, arg2) {
  if err throw err
  console.log(arg1, arg2)
})
```

Coffeescript
```coffeescript
async [
    ->
	  setTimeout @_then(), 500
	  console.log 'Waiting 500ms...'
    ->
	  @url = 'http://google.fr'
	  request @url, @_then()
	  console.log 'requesting google...'

    (err, res, body) ->
	  console.log "#{@url} has arrived"
	  @_error err
	  @_end 'arg1', 'arg2'

], (err, arg1, arg2) ->
  throw err if err
  print arg1, arg2
```

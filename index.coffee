module.exports = (funcs, end) ->
	i = 0
	context = 

		_then: ->
			if i+1 >= funcs.length
				throw new Error 'Already in the last function : no more function to call'

			funcs[++i].bind context

		_end: ->
			if not end
				throw new Error 'No end function defined (second argument)'

			args = (a for a in arguments)
			args.unshift null
			end.apply context, args

		_error: (err) ->
			if not end
				throw new Error 'Cannot transmit error : No end function defined (second argument)'

			return unless err
			end.apply context, [err]


	funcs[0].apply context
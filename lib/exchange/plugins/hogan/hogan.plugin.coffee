# Export Plugin
module.exports = (BasePlugin) ->
	# Requires
	hogan = null

	# Define Plugin
	class HoganPlugin extends BasePlugin
		# Plugin name
		name: 'hogan'

		# Plugin priority
		priority: 750

		# Render some content
		render: ({inExtension,outExtension,templateData,file}, next) ->
			try
				if inExtension is 'hogan'
					hogan = require('hogan.js')  unless hogan
					file.content = hogan.compile(file.content).render(templateData)
					next()
				else
					next()
			catch err
				return next(err)

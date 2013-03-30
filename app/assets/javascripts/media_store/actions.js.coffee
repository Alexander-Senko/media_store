document.on 'dom:loaded', ->
	document.click_handlers =
		Element.retrieve(document, 'prototype_event_registry').get('click')

	for link in $$ '.bulk .action a[rel=nofollow]'
		link.selector ||=
			".#{link.up('.action').className.gsub(/\s+/, '.')} a"

		link.on 'click', (event) ->
			link = event.target

			event.stop()

			for item_link in $$ ".selected #{link.selector}"
				for handler in document.click_handlers
					# TODO: fix the error & remove defer
					handler.defer Object.extend(Object.clone(event), {
						target: item_link
					})

document.on 'click', '.selectable', ->
	for link in $$ '.bulk .action a:not([rel=nofollow])'
		link.href =
			link.dataset.url ||= link.href

		if (ids = collect_ids '.selected').any()
			link.href += '?' + $H(
				'id[]': ids
			).toQueryString()


# Helper functions

collect_ids = (selector) ->
	$$(selector).map (element) ->
		element.id.sub /^(?:(.+)_)?(\d+)/, '#{2}'

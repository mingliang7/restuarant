Template.list_invoices.helpers
	invoices: ->
		invoices = Restuarant.Collection.Invoice.find().fetch()
		$.each invoices, (index, invoice) ->
			invoice.index = index
		invoices
	isEven: (index) ->
		index % 2 is 0
	format: (createdAt) ->
		moment(createdAt).format('hh:mm a')
Template.list_invoices.events
	'change .check': (event) ->
		element = $(event.currentTarget)
		value = element.prop('checked')
		element.parents('li.finished').addClass('delete-mark') if value is yes
		element.parents('li.finished').removeClass('delete-mark') if value is no

	'change .done': (event) ->
		current = @invoiceId
		element = $(event.currentTarget)
		value = element.prop('checked')
		if value is yes
			element.parents('.timeline-entry').find(".check").prop('checked', true)
			element.parents('.timeline-entry').find("li.finished").addClass('delete-mark')
		else
			element.parents('.timeline-entry').find(".check").prop('checked', false)
			element.parents('.timeline-entry').find("li.finished").removeClass('delete-mark')

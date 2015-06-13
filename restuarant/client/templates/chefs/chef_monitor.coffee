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
	progress: (id) ->
		#unCooked = Restuarant.Collection.Invoice.find({_id: id, 'product.cooked': false}).count()
		cooked = Restuarant.Collection.Invoice.findOne({_id: id})
		total_cooked = 0
		if cooked isnt undefined
			cooked.product.forEach (product) ->
				if product.cooked is true
					total_cooked += 1
		total = cooked.product.length
		(total_cooked * 100)/total
	completed: (id) ->
	#unCooked = Restuarant.Collection.Invoice.find({_id: id, 'product.cooked': false}).count()
		cooked = Restuarant.Collection.Invoice.findOne({_id: id})
		total_cooked = 0
		if cooked isnt undefined
					debugger
			cooked.product.forEach (product) ->
				if product.cooked is true
					total_cooked += 1
		total = cooked.product.length
		result = (total_cooked * 100)/total
		result is 100
Template.list_invoices.events
	'change .check': (event) ->
		element = $(event.currentTarget)
		id = element.parents('p.invoiceId').find('.id').val()
		value = element.prop('checked')

		if value is yes
			Meteor.call 'setCooked', id, @name
		else
			Meteor.call 'unsetCooked', id, @name

	'change .done': (event) ->
		current = @invoiceId
		element = $(event.currentTarget)
		value = element.prop('checked')

		if value is yes
			Meteor.call 'setAllCooked', @_id
		else
			Meteor.call 'unSetAllCooked', @_id

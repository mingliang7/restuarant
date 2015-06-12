Template.restuarant_chef.helpers
	invoices: () ->
		invoices = Restuarant.Collection.Invoice.find().fetch()
		$.each invoices, (index, invoice) ->
			invoice.index = index
		invoices
	isEven: (index) ->
		true if index % 2 is 0
	isOdd: (index) ->
		true if index % 2 isnt 0
	format: (createdAt) ->
		moment(createdAt).format('hh:mm a')
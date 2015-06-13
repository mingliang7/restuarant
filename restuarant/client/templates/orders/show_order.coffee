confirmOrderformField = (index, product)->
	name = '[name="product.' + index + '.name"]'
	price = '[name="product.' + index + '.price"]'
	amount = '[name="product.' + index + '.amount"]'
	total_unit_price = '[name="product.' + index + '.total_unit_price"]'
	$("#{name}").val(product.name)
	$("#{price}").val(product.price)
	$("#{amount}").val(product.amount)
	$("#{total_unit_price}").val(product.total_unit_price)

findTempProducts = (product_objects)->
	Session.set 'temp_products', product_objects.fetch()

fetchTempProducts = ->
	tempProducts = Restuarant.Collection.TempProduct.find {userId: Meteor.user()._id, confirmed: false}
	findTempProducts(tempProducts)

addToForm = () ->
	products = Session.get 'temp_products'
	cancel_products_length = Session.get 'cancel_form'
	if products isnt undefined && (cancel_products_length is undefined || cancel_products_length is null)
		$('[name="invoiceId"]').val($('#table-number').text())
		$.each products, (index, product) ->
			if index is 0
				confirmOrderformField(index, product)
			else
				$('.autoform-add-item').click()
				setTimeout(
					->
						confirmOrderformField(index, product)
					500
				)
	else if products isnt undefined && cancel_products_length isnt null
		old_index = cancel_products_length
		$('[name="invoiceId"]').val($('#table-number').text())
		$.each products, (index, product) ->
			last_first_index = old_index
			last_index = index + old_index
			if last_index is last_first_index
				confirmOrderformField(old_index, product)
			else
				$('.autoform-add-item').click()
				setTimeout(
					->
						confirmOrderformField(last_index, product)
					500
				)

		Session.set 'cancel_form', null
	$('[name="total"]').val($('#total').text())
	$('.btn-delete').addClass('hidden')
	$('.confirm').removeClass('hidden')
	alertify.success 'Successfully added'

clearForm = () ->
	products = Session.get 'temp_products'
	old_products = Session.get 'old_products'
	Session.set 'old_products',  old_products + products.length #sum old_products length together
	console.log Session.get 'old_products'
	$('[name="total"]').val('')
	$('[name="invoiceId"]').val('')
	$.each products, (index, product) ->
		$('.autoform-remove-item').click()
	$('.autoform-add-item').click()
	Session.set 'cancel_form', Session.get 'old_products'
	alertify.warning 'Successfully cancel'

Template.restuarant_showOrder.events
  'click .timeline-panel': (e)->
    obj = $(e.currentTarget)
    $('.timeline-body', obj).toggle()

Template.restuarant_showOrder.getCategories = (category) ->
	Meteor.render Template[category]

Template.restuarant_showOrder.onRendered ->
	Meteor.call 'removeTempProduct', Meteor.user()._id
	Session.set 'old_products', 0
	
Template.restuarant_showOrder.helpers
	categories: () ->
		lists = []
		increment = 0
		restuarants = Restuarant.Collection.FoodCategory.find()
		restuarants.forEach (category) ->
			category.number = increment
			increment++
			lists.push category
		lists

	isZero: (number) ->
 		number is 0
Template.restuarant_showOrder.helpers
		products: (category_id)->
			Restuarant.Collection.Product.find {category: category_id}

Template.restuarant_showOrder.helpers
	temp_invoice: ->
		Session.get 'temp_products'
	total_temp_invoice: ->
		products = Session.get 'temp_products'
		total = 0
		products.forEach (product) ->
			total += product.total_unit_price
		total

Template.restuarant_showOrder.events
	'click .product': ->
		currentProduct = @
		product = Restuarant.Collection.TempProduct.findOne {_id: @_id, confirmed: false, userId: Meteor.user()._id}
		if product is undefined
			currentProduct.amount = 1
			currentProduct.total_unit_price = @price
			currentProduct.confirmed = false
			Restuarant.Collection.TempProduct.insert currentProduct
		else
			Restuarant.Collection.TempProduct.update({_id: product._id},{$set:{amount: product.amount += 1, total_unit_price: product.total_unit_price += product.price}})
		fetchTempProducts()

	'click .delete': ->
		currentProduct  = @
		Restuarant.Collection.TempProduct.remove(currentProduct._id)
		fetchTempProducts()

	'click .cancel': ->
		clearForm()
		Meteor.call('removeTempProduct', Meteor.user()._id)
		fetchTempProducts()
		$('.add-to-invoice').attr('disabled', false)

	'click .confirm': ->
		$('.confirm-invoice').trigger('click')
		Meteor.call 'removeTempProduct', Meteor.user()._id
		fetchTempProducts()
		Session.set 'old_products', 0 #set old product length to 0
		$('.add-to-invoice').attr('disabled', false)

	'click .add-to-invoice': ->
		addToForm()
		$('.add-to-invoice').attr('disabled', true)

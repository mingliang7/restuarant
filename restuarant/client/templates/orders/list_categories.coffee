findTempProducts = (product_objects)->
	Session.set 'temp_products', product_objects.fetch()

fetchTempProducts = ->
	tempProducts = Restuarant.Collection.TempProduct.find {userId: Meteor.user()._id, confirmed: false}
	findTempProducts(tempProducts)

Template.restuarant_showOrder.onRendered ->
	Meteor.call 'removeTempProduct', Meteor.user()._id
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
		console.log Session.get 'temp_products'
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
			console.log currentProduct
			Restuarant.Collection.TempProduct.insert currentProduct
		else
			Restuarant.Collection.TempProduct.update({_id: product._id},{$set:{amount: product.amount += 1, total_unit_price: product.total_unit_price += product.price}})
		fetchTempProducts()
	'click .delete': ->
		currentProduct  = @
		Restuarant.Collection.TempProduct.remove(currentProduct._id)
		fetchTempProducts()
	'click .cancel': ->
		Meteor.call('removeTempProduct', Meteor.user()._id)
		fetchTempProducts()
	'click .confirm': ->

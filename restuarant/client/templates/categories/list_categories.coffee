@Obj = []
@Products = {}
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
		arr = []
		products = Session.get 'products'
		for k,v of products
			arr.push v
		console.log arr
		arr
Template.restuarant_showOrder.events
	'click .product': ->
		Products["#{@_id}"] =
				'_id': @_id
				'name': @name
				'price': @price
				'amount':
					if @amount is undefined
						@amount = 1
					else
						@amount += 1
				'total_unit_price': @amount * @price
		Session.set 'products', Products

	'click .delete': ->
		currentProduct  = @
		delete Products[currentProduct._id]
		console.log Products
		Session.set 'products', Products

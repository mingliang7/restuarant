Template.list_categories.helpers
	categories: () ->
		Restuarant.Collection.FoodCategory.find()

Template.list_categories.events
	'click .category': () ->
		product_list = []
		products = Restuarant.Collection.Product.find {category: @_id}
		products.forEach (product) ->
			product_list.push product.name

		alert product_list.join(', ')
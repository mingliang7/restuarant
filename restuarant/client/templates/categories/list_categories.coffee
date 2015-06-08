@Obj = []
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

Template.restuarant_showOrder.events
	'click .product': ->
		current = @
		Obj.push @
		Obj.forEach (product) ->
			if current.name is product.name
				if product.amount is undefined
					product.amount = 1
				else
					product.amount += 1
					Obj.pop(current)

			else if product.amount is undefined
				product.amount = 1

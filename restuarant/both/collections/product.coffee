Restuarant.Collection.Product = new Mongo.Collection('products')

Restuarant.Schema.Product = new SimpleSchema(
	name:
		type: String
		max: 20

	price:
		type: Number
		max: 20
		decimal: true

	category:
		type: [String]
		autoform:
			type: 'select2'
			options: ->
				list = []
				categories = Restuarant.Collection.FoodCategory.find()
				categories.forEach (category) ->
					list.push {value: category._id, label: category.name}
				list
)

Restuarant.Collection.Product.attachSchema Restuarant.Schema.Product

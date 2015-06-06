Meteor.publish 'restuarant_order_table', ->
  if @userId
    Restuarant.Collection.OrderTable.find()

Meteor.publish 'restuarant_food_category', ->
  if @userId
    Restuarant.Collection.FoodCategory.find()

Meteor.publish 'restuarant_product', ->
	if @userId
		Restuarant.Collection.Product.find()
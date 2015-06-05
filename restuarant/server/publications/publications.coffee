Meteor.publish 'restuarant_order_table', ->
  if @userId
    Restuarant.Collection.OrderTable.find()

Meteor.publish 'restuarant_food_category', ->
  if @userId
    Restuarant.Collection.FoodCategory.find()

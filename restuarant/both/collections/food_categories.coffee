Restuarant.Collection.FoodCategory = new Mongo.Collection('food_categories')

Restuarant.Schema.FoodCategory = new SimpleSchema(
  name:
    type: String
    max: 20
)

Restuarant.Collection.FoodCategory.attachSchema Restuarant.Schema.FoodCategory

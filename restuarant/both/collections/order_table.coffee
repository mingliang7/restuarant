Restuarant.Collection.OrderTable = new Mongo.Collection('order_tables')

Restuarant.Schema.OrderTable = new SimpleSchema(
  name:
    type: String
    max: 20
)

Restuarant.Collection.OrderTable.attachSchema Restuarant.Schema.OrderTable

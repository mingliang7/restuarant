Restuarant.Collection.OrderTable = new Mongo.Collection('order_tables')

Restuarant.Schema.OrderTable = new SimpleSchema(
  name:
    type: String
    max: 20
)

Restuarant.Collection.OrderTable.before.insert (userId, doc) ->
  doc._id = doc.name

Restuarant.Collection.OrderTable.attachSchema Restuarant.Schema.OrderTable

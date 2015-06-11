Restuarant.Collection.TempProduct = new Mongo.Collection('temp_products')

Restuarant.Collection.TempProduct.before.insert (userId, doc) ->
  doc.userId = userId

Meteor.methods
 removeTempProduct: (userId) ->
   Restuarant.Collection.TempProduct.remove({userId: userId})
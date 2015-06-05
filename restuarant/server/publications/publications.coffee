Meteor.publish 'restuarant_order_table', ->
  if @userId
    return Restuarant.Collection.OrderTable.find()

Meteor.methods
  removeTempProduct: (userId) ->
    Restuarant.Collection.TempProduct.remove({userId: userId})
    $('.confirm').addClass('hidden')

  setCooked: (id, name) ->
    console.log id
    console.log name
    Restuarant.Collection.Invoice.update({_id: id,'product.name': "#{name}"}, {$set: {'product.$.cooked': true}})

  unsetCooked: (id, name) ->
    Restuarant.Collection.Invoice.update({_id: id,'product.name': "#{name}"}, {$set: {'product.$.cooked': false}})

  setAllCooked: (id) ->
    invoices = Restuarant.Collection.Invoice.findOne({_id: id })
    invoices.product.forEach (product) ->
      Restuarant.Collection.Invoice.update({_id: id, 'product.cooked': false}, {$set: {'product.$.cooked': true}})

  unSetAllCooked: (id) ->
    invoices = Restuarant.Collection.Invoice.findOne({_id: id })
    invoices.product.forEach (product) ->
      Restuarant.Collection.Invoice.update({_id: id, 'product.cooked': true}, {$set: {'product.$.cooked': false}})

Template.restuarant_confirmOrder.helpers
  fillInForm: ->
    products = Session.get 'temp_products'
    if products isnt undefined
      name = []
      products.forEach (product) ->
        name.push product.name
      $('[name="product.0.name"]').val(name.join(','))

AutoForm.hooks
  restuarant_confirmOrder:
    onSuccess: (formType, result) ->
      alertify.success 'Successfully'
    onError: (formType, error) ->
      alertify.error error.message

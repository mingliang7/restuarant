Template.restuarant_order.onRendered ->
  createNewAlertify(["restuarant_form"])

Template.restuarant_number.events
  "click .flatbtn": () ->
    alertify.restuarant_form(fa("plus", "Table"), renderTemplate(Template.restuarant_form))

Template.restuarant_number.helpers
  restuarant_tables: ->
    Restuarant.Collection.OrderTable.find {}


AutoForm.hooks
  restuarant_form:
    onSuccess: (formType, result) ->
      alertify.success 'Successfully'

    onError: (formType, error ) ->
      alertify.error error.message

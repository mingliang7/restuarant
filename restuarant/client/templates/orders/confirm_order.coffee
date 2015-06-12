AutoForm.hooks
  restuarant_confirmOrder:
    before:
      insert: (doc) ->
        dateTime = moment(new Date()).format('YYYY-MM-DD hh:mm:ss a')
        doc.tableNumber = doc.invoiceId
        doc.invoiceId = "0#{doc.invoiceId}-#{dateTime}"
        doc
    onSuccess: (formType, result) ->
      alertify.success 'Successfully'
    onError: (formType, error) ->
      alertify.error error.message

AutoForm.hooks
  restuarant_confirmOrder:
    before:
      insert: (doc) ->
        dateTime = moment(new Date()).format('HH:mm:ss-YYYYMMDD')
        doc.tableNumber = doc.invoiceId
        prefix= "#{doc.invoiceId}-#{dateTime}"
        doc.invoiceId = idGenerator.genWithPrefix(Restuarant.Collection.Invoice, prefix, 3, "invoiceId" )
        doc
    onSuccess: (formType, result) ->
      alertify.success 'Successfully'
    onError: (formType, error) ->
      alertify.error error.message

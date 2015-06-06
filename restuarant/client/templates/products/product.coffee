Template.restuarant_product.onRendered ->
	createNewAlertify('product')
Template.restuarant_product.events
	'click .insert': () ->
		alertify.product(fa('plus', 'product'),renderTemplate(Template.restuarant_product_form_insert))


AutoForm.hooks
	restuarant_product_form_insert:
		onSuccess: (formType, result) ->
			alertify.success 'Successfully'

		onError: (formType, error) ->
			alertify.error error.message		
Template.restuarant_category.onRendered ->
  createNewAlertify('category')

Template.restuarant_category.events
  "click .insert": () ->
    alertify.category(fa('plus', 'Category'), renderTemplate(Template.restuarant_category_form_insert))

  "click .update":() ->
    category = Restuarant.Collection.FoodCategory.findOne _id: @_id
    alertify.category(fa('pencil', 'Update Category'), renderTemplate(Template.restuarant_category_form_update, category))

  "click .show": ->
    category = Restuarant.Collection.FoodCategory.findOne _id: @_id
    alertify.alert(fa('eye', 'Show'), renderTemplate(Template.show_category, category))

  "click .remove": ->
    id = @_id
    alertify.confirm(
      fa('remove', 'Remove category'),
      "Are you sure to delete #{@name}?",
      ->
        Restuarant.Collection.FoodCategory.remove id, (error) ->
          if error is 'undefined' then alertify.error error.message else alertify.success 'Successfully'

      null
    )

AutoForm.hooks
  restuarant_category_form_insert:
    onSuccess: (formType, result) ->
      alertify.success 'Successfully'

    onError: (formType, error) ->
      alertify.error error.message

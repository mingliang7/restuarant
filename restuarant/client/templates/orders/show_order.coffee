Template.restuarant_showOrder.events
  'click .timeline-panel': (e)->
    obj = $(e.currentTarget)
    $('.timeline-body', obj).toggle()

Template.restuarant_showOrder.getCategories = (category) ->
	Meteor.render Template[category]
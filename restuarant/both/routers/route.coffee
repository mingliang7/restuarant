Router.route 'restuarant/orders',
  ->
    @render 'restuarant_order'

  name: 'restuarant.order'

Router.route 'restuarant/orders/:_id',
  ->
    @render 'restuarant_showOrder',
    data: ->
      Restuarant.Collection.OrderTable.findOne _id: @params._id


  name: 'restuarant.order.show'

Router.route 'restuarant/chefs',
  ->
    @render 'restuarant_chef'

  name: 'restuarant.chef'
  header:
    title: 'Chef Monitor'
    sub: ''
    icon: 'file-text-o'

Router.route 'restuarant/categories',
  ->
    @render 'restuarant_category'

  name: 'restuarant.category'
  header:
    title: 'Category'
    sub: ''
    icon: 'file-text-o'

Router.route 'restuarant/products',
  ->
    @render 'restuarant_product'

  name: 'restuarant.product'
  header:
    title: 'Product'
    sub: ''
    icon: 'file-text-o'
    
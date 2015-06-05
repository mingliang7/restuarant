Router.route 'restuarant/orders',
  ->
    @render 'restuarant_order'

  name: 'restuarant.order'
  header:
    title: 'order'
    sub: ''
    icon: 'file-text-o'
  title: 'My restuarant'

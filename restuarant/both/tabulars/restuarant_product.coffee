Restuarant.TabularTable.Product = new (Tabular.Table)(
  name: 'restuarantProductList'
  collection: Restuarant.Collection.Product
  columns: [
    {
      data: '_id'
      title: 'ID'
    }
    {
      data: 'name'
      title: 'Name'
    }
    {
      data: 'category'
      title: 'Category'
      render: (val, type, doc) ->
        list = []
        for category_id in val 
          category = Restuarant.Collection.FoodCategory.findOne _id: category_id
          list.push category.name        
        if typeof val isnt undefined then JSON.stringify list.join(', ')  else null
    }
    {
      data: 'price'
      title: 'Price'
    }
    {
      title: '<i class="fa fa-bars"></i>'
      tmpl: Meteor.isClient and Template.restuarant_productAction
    }
  ]
  order: [ [
    '0'
    'desc'
  ] ]
  columnDefs: [ {
    'width': '12px'
    'targets': 4
  } ])

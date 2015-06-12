Restuarant.Collection.Invoice = new Mongo.Collection('invoices')
Restuarant.Schema.Invoice = new SimpleSchema(
  invoiceId:
    type: String
    label: 'invoiceId'

  product:
    type: Array

  'product.$':
    type: Object

  'product.$.name':
    type: String

  'product.$.amount':
    type: Number

  'product.$.price':
    type: Number
    decimal: true


  'product.$.total_unit_price':
    type: Number
    decimal: true

  total:
    type: Number
    decimal: true

  userId:
    type: String
    autoValue: ->
      if @isInsert || @isUpdate
        Meteor.user()._id

  createdBy:
    type: String
    autoValue: ->
      if @isInsert
        Meteor.user().username

  updatedBy:
    type: String
    autoValue: ->
      Meteor.user().username

  createdAt:
    type: Date
    autoValue: ->
      if @isInsert
        new Date()

  updatedAt:
    type: Date
    optional: true
    autoValue: ->
      new Date()
)

Restuarant.Collection.Invoice.attachSchema Restuarant.Schema.Invoice

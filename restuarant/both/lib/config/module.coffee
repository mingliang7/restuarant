@Module = if typeof Module is 'undefined' then {} else Module
Meteor.isClient && Template.registerHelper('Module', Module)

Module.Restuarant =
    name: 'Restuarant Project'
    version: '0.0.1'
    summary: 'Rabbit Management System is ...'
    roles: [
        'admin'
        'general'
        'reporter'
    ]

Module = if typeof Module is 'undefined' then {} else Module
Meteor.isClient && Template.registerHelper('Module', Module);

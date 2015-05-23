Template.appMainView.helpers
#    eventsubscriptions:->
#        EventSubscribed.find({userId:Meteor.userId()})
#    
Template.appMainView.rendered = ->
    App.ebtn = false
    
    
    
Template.appMainView.events
    'click #surfaceEventnameAppmainview' : (e) ->
        e.preventDefault()
        id = this.eventSubscribed
        if App.ebtn is false
            console.log id
            App.ebtn = true
            Router.go '/'+id
            
        Meteor.setTimeout ->
            App.ebtn = false
            console.log 'ebtn released'
        ,500
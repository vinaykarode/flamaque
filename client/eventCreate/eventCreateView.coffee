Template.eventCreateView.events
    'submit #eventCreate':(e)->
        e.preventDefault()
        events =
            userId:Meteor.userId()
            eventname:e.target.eventname.value
        eventId = Events.insert events, =>
            console.log eventId
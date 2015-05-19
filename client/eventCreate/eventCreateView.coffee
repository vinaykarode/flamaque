Template.eventCreateView.events
    'submit #eventCreate':(e)->
        e.preventDefault()
        events =
            eventOwner:Meteor.userId()
            eventname:e.target.eventname.value
        
        if events.eventname isnt ''
            eventId = Events.insert events, =>                  #insert newly created event into Events document
                console.log eventId
                Session.set 'eventName',events.eventname
                eventSubscribers =
                    eventId:eventId
                    subscriberUserId:events.eventOwner
                subscriberID = EventSubscribers.insert eventSubscribers #insert the owner of event as one of the subscriber of this event
                eventSubscribed = 
                    userId:events.eventOwner
                    eventSubscribed:eventId
                    eventSubscribedName:events.eventname
                subscribedId = EventSubscribed.insert eventSubscribed, =>  #insert event into subscribed list to show all the events subscribed to by the user
                    console.log 'event added to subscribed list'
        else
            $('#eventName').attr('placeholder':'Please enter event name')
            
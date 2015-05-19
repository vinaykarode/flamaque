#====================publish currentuser so the client can wait during initial login without displaying the login template=====================
Meteor.publish 'currentuser', (id) ->
    Meteor.users.find({_id:id})
    
#==================publish events for the user to insert data by checking the userID and publishing only events created by user=================================    
Events.allow
    insert : (userId,doc,fields,modifier) ->
        console.log doc
        return userId
    update: (userId,doc,fields,modifier) ->
        return false
    remove: (userId, doc) ->
        return false

Meteor.publish 'events',(Id)->
    Events.find({eventOwner:Id})


# ==============insert collection with new subscribers, update and remove subscribers by users in eventSubscribed collection and owner of the event=======================

EventSubscribers.allow
    insert: (userId,doc)->
        return userId                       #event creator inserts the first event
    update: (userId,doc,fields,modifier)->
        return userId                       #anyother logged uses can subscribe to this event
    remove: (userId, doc) ->
        return userId                       #users who have subcribed to an event can un-join an event

Meteor.publish 'eventsubscribers',(Id)->
    EventSubscribers.find({eventId:Id})        #only publish the subscribers to a particular event


#========================== this collection holds info on all the events a user is subscribed to, which will be displayed in the events page==================

EventSubscribed.allow
    insert: (userId,doc)->                      # the event subscribed to by a user is inserted
        return userId                       
    update: (userId,doc,fields,modifier)->
        return userId                       
    remove: (userId, doc) ->
        return userId                       

Meteor.publish 'eventsubscribed',(Id)->
    EventSubscribed.find({userId:Id})        #only publish the events subscribed to by one user

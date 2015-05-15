#====================publish currentuser so the client can wait during initial login without displaying the login template=====================
Meteor.publish 'currentuser', (id) ->
    Meteor.users.find({_id:id})
    
#==================publish events for the user to insert data by checking the userID and publishing only events created by user=================================    
Events.allow
    insert : (userId,doc) ->
        return userId
    update: (userId,doc,fields,modifier) ->
        return false
    remove: (userId, doc) ->
        return false

Meteor.publish 'events',(Id)->
    Events.find({userId:Id})
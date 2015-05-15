Meteor.publish 'currentuser', (id) ->
    Meteor.users.find({_id:id})
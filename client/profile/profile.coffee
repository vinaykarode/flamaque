Template.profile.helpers
    currentUser: ->
        Meteor.user().username

Template.profile.events
    'click #logout': (e) ->
        e.preventDefault()
        Meteor.logout (err) ->
            if err
                console.log err
            else
                Router.go '/'
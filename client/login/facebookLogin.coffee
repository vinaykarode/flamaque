Template.facebookLogin.events
    "click #facebook-login": (e,v)->
        e.preventDefault()
        Meteor.loginWithFacebook {},(err)->
            if err
                Session.set 'errorMessage', err.reason || 'unknown reason'
            else
                Router.go '/main'
            return false
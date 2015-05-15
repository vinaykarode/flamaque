Template.login.events 
    'submit #login-form': (e,t) ->
        e.preventDefault()
        emailUsername = t.find('#login-email-username').value
        password = t.find('#login-password').value
        
        emailUsername = App.trimInput(emailUsername)
    
        if App.isValidPassword(password)
             Meteor.loginWithPassword emailUsername,password,(err) ->
                if err
                    Session.set 'errorMessage',err.reason
                else
                    Router.go '/'
                return
            false
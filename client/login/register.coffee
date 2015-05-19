Template.register.events 'submit #register-form': (e, t) ->
    e.preventDefault()
    email=t.find('#account-email').value
    password = t.find('#account-password').value
    username = t.find('#account-username').value
#    Trim and validate input

    email = App.trimInput(email)
    
    if App.isValidPassword(password) && App.isValidUsername(username)
        Accounts.createUser {
            username:username
            email:email
            password:password
        },(err) ->
            if err
                Session.set 'errorMessage',err.reason
            else
                Router.go '/'
            return
        false

Template.register.helpers
    'errorMessage':->
        Session.get 'errorMessage'
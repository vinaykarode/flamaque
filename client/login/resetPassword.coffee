Accounts.onResetPasswordLink (token, done) ->
    Session.set 'resetPasswordToken', token

Template.resetPassword.helpers
    resetPassword: (t)->
        Session.get 'resetPassword'
    resetMessageDisplay: ->
        Session.get 'resetMessageDisplay'

Template.resetPassword.events
    'submit #forgot-password':(e,t) ->
        e.preventDefault()
        recoveryEmail = App.trimInput t.find('#recoveryEmail').value
        if recoveryEmail
            Accounts.forgotPassword {email:recoveryEmail},(err)->
                    if err
                        Session.set 'resetMessageDisplay', err.reason
                    else
                        Session.set 'resetMessageDisplay', 'Please check you email'
                    return false
    
    'submit #new-password':(e,t) ->
        e.preventDefault()
        newPassword = t.find('#newPassword').value
        if newPassword && App.isValidPassword(newPassword)
            Accounts.resetPassword Session.get 'resetPasswordToken', newPassword, (err) ->
                if err
                    Session.set 'resetMessageDisplay', err.reason
                else
                    Session.set 'resetMessageDisplay', null
                    Session.set 'resetPasswordToken', null
                return false
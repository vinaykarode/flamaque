#
#ServiceConfiguration.configurations.update({
#    service:"facebook"
#}, {
#    $set: {
#        appId: '1568619163403472',
#        secret:'bb5fa6d109518501d9fb1a8690270c25'
#    }
#});

Accounts.validateNewUser (user) ->
  if user.username and user.username.length >= 3 or user.emails
    #console.log user
    return true
  else
    console.log user.emails
    throw new (Meteor.Error)(403, 'Username and Email are required')
  return

ServiceConfiguration.configurations.update
    service:"facebook",
        $set:
            appId: '1568619163403472',
            secret:'bb5fa6d109518501d9fb1a8690270c25'
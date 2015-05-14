
App.trimInput = (val) ->
    val.replace(/^\s*|\s*$/g, "")

App.isValidPassword = (val) ->
#    val.length &gt;= 6 ? true : false;
    if val.length >= 6
        true
    else
        Session.set 'errorMessage','Password should be atleast 6 characters'
        return false
        
App.isValidUsername = (val)->
    if val.length >=3
        true
    else
        Session.set 'errorMessage','Username should be atleast 3 characters'
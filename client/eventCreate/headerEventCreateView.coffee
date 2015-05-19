Template.headerEventCreateView.helpers
    eventName: ->
        Session.get 'eventName'
    toggleEventNameInput: (value)->
        if value is 'form' and Session.get 'eventName'
            return 'toggleEventNameInput'
        else
            return ''
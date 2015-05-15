Template.eventCreateView.events
    'submit #eventCreate':(e)->
        e.preventDefault()
        console.log e.target.eventName.value
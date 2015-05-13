Template.appMainView.rendered = ->
    flag = off
    fviewEvent = FView.byId("events")
    fviewEventTarget = fviewEvent.surface
    fviewEventTarget.on "click",(evt) =>
        if flag is off
            flag = on
        
            s = fviewEvent
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-50,0),{duration: 100},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 100}
     
            Meteor.setTimeout ->
              flag = off
            ,500
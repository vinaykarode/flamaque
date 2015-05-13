Template.appMainView.rendered = ->
    flag = off
    fviewEvent = FView.byId("events")
    fviewEventTarget = fviewEvent.surface
    
    fviewCamera = FView.byId("camera")
    fviewCameraTarget = fviewCamera.surface
    
    fviewProfile = FView.byId("profile")
    fviewProfileTarget = fviewProfile.surface
    
    fviewEventTarget.on "click",(evt) =>
        if flag is off
            flag = on
        
            s = fviewEvent
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500    
    fviewCameraTarget.on "click",(evt) =>
        if flag is off
            flag = on
        
            s = fviewCamera
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500    
    fviewProfileTarget.on "click",(evt) =>
        if flag is off
            flag = on
        
            s = fviewProfile
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500
Template.footerTemplate.rendered = ->
    flag = off
    
    syncEvents = new Famous.GenericSync ['mouse','touch']
    fviewEventSurface = FView.byId('events').surface
    fviewEventSurface.pipe syncEvents
    syncEvents.on 'end', (evt)->
        if flag is off
            flag = on
        
            s = FView.byId('events')
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70},=>
                    Router.go '/'
     
            Meteor.setTimeout ->
              flag = off
            ,500 

    syncCamera = new Famous.GenericSync ['mouse','touch']
    fviewCameraSurface = FView.byId('camera').surface
    fviewCameraSurface.pipe syncCamera
    syncCamera.on 'end', (evt)->
        if flag is off
            flag = on
        
            s = FView.byId('camera')
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500
     
    syncProfile = new Famous.GenericSync ['mouse','touch']
    fviewProfileSurface = FView.byId('profile').surface
    fviewProfileSurface.pipe syncProfile
    syncProfile.on 'end', (evt)=>
        if flag is off
            flag = on
        
            s = FView.byId('profile')
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70},=>
                    Router.go '/profile'
     
            Meteor.setTimeout ->
              flag = off
            ,500
    

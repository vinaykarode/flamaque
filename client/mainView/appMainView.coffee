Template.appMainView.rendered = ->
    flag = off
    
    sync = new Famous.GenericSync ['mouse','touch']
    #fviewEvent = FView.byId('events')
    #fviewEventTarget = fviewEvent.surface
    fviewEventSurface = FView.byId('events').surface
    fviewEventSurface.pipe sync
    
    fviewCamera = FView.byId("camera")
    fviewCameraTarget = fviewCamera.surface
    
    fviewProfile = FView.byId("profile")
    fviewProfileTarget = fviewProfile.surface
    
    sync.on 'end', (evt)->
        if flag is off
            flag = on
        
            s = FView.byId('events')
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
    

    #****************************click event for the add button********************
    fviewAdd = FView.byId("add")
    fviewAddTarget = fviewAdd.surface    
    fviewAddTarget.on "click",(evt) =>
        if flag is off
            flag = on
        
            s = fviewAdd
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500
    #=============================click event for the add button ====================
    
    #******************************SEARCH click event*******************************
    fviewSearch = FView.byId("searchEvent")
    fviewSearchTarget = fviewSearch.surface    
    fviewSearchTarget.on "click",(evt) =>
        if flag is off
            flag = on
        
            s = fviewSearch
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500
            
    #==============================End Search click event===========================

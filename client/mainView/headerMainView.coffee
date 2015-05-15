Template.headerMainView.rendered = ->
        #****************************click event for the add button********************
    flag = off
    
    syncSearchEvent = new Famous.GenericSync ['mouse','touch']
    fviewSearchEventSurface = FView.byId('searchEvent').surface
    fviewSearchEventSurface.pipe syncSearchEvent
    syncSearchEvent.on 'end', (evt)->
        if flag is off
            flag = on
        
            s = FView.byId('searchEvent')
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70}
     
            Meteor.setTimeout ->
              flag = off
            ,500 

    #=============================click event for the add button ====================
    
    #******************************SEARCH click event*******************************
    syncAddEvent = new Famous.GenericSync ['mouse','touch']
    fviewAddSurface = FView.byId('add').surface
    fviewAddSurface.pipe syncAddEvent
    syncAddEvent.on 'end', (evt)->
        if flag is off
            flag = on
        
            s = FView.byId('add')
            console.log {evt}
            s.modifier.setTransform Famous.Transform.translate(-20,0),{duration: 70},=>
                s.modifier.setTransform Famous.Transform.translate(0,0),{duration: 70},=>
                    Router.go '/eventCreate'
     
            Meteor.setTimeout ->
              flag = off
            ,500 
            
    #==============================End Search click event===========================

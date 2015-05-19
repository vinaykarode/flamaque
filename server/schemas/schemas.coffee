Schemas = {}

Schemas.events = new SimpleSchema
    eventname:
        type: String
        label: "text"
        max: 25
        optional: false
    eventOwner:
        type:String
        label:'userID'
        optional:false    
    createdAt:
        type: Date
        label: "Create Date"
        denyUpdate: true
        optional: false
        autoValue: ->
            if (this.isInsert)
                return new Date
            else
              if (this.isUpsert)
                return {$setOnInsert: new Date}
              else
                this.unset()
 
 
 
Events.attachSchema Schemas.events

#===============================================EventSubscribers collection===================================

Schemas.eventsubscribers = new SimpleSchema
    eventId:                                        #eventId will always be constant for one event
        type:String
        label:'eventId'
        optional:false
    subscriberUserId:                               #subscribers Id will change depending on number users subscribing
        type:String
        label:'subscribers'
        optional:false
    createdAt:
        type: Date
        label: "Create Date"
        denyUpdate: true
        optional: false
        autoValue: ->
            if (this.isInsert)
                return new Date
            else
              if (this.isUpsert)
                return {$setOnInsert: new Date}
              else
                this.unset()
                
EventSubscribers.attachSchema Schemas.eventsubscribers
        
#    =============================================EventSubscribed Collection====================================

Schemas.eventsubscribed = new SimpleSchema
    userId:                        #userId will be constant, this collection will list the events subscribed by one user
        type:String
        label:'userId'
        optional:false
    eventSubscribed:              #all the various events subscribed by one single user                          
        type:String
        label:'eventId'
        optional:false
    eventSubscribedName:
        type:String
        label:'eventName'
        optional:false
    createdAt:
        type: Date
        label: "Create Date"
        denyUpdate: true
        optional: false
        autoValue: ->
            if (this.isInsert)
                return new Date
            else
              if (this.isUpsert)
                return {$setOnInsert: new Date}
              else
                this.unset()
                
EventSubscribed.attachSchema Schemas.eventsubscribed
 
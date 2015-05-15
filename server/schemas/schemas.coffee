Schemas = {}

Schemas.events = new SimpleSchema
    eventname:
        type: String
        label: "text"
        max: 25
        optional: false
    userId:
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
Router.configure
    loadingTemplate: 'loading'
    waitOn: ->
        [Meteor.subscribe 'currentuser'
        Meteor.subscribe 'events',Meteor.userId()]

requireLogin = ->
    if !Meteor.user()
        this.render 'login'
    else
        this.next()
#
Router.onBeforeAction requireLogin
 
Router.route '/',
    waitOn: ->
        Meteor.subscribe 'eventsubscribed', Meteor.userId()
    data: ->
        eventsubscriptions: EventSubscribed.find({userId:Meteor.userId()},{sort:{createdAt: -1}})
    name: 'appMainView'

Router.route '/login', ->
  this.render 'login'

Router.route '/resetPassword', ->
    this.render 'resetPassword'

Router.route '/eventCreate',->
    this.render 'eventCreateView'

Router.route '/profile', ->
    this.render 'profile'

Router.route '/:_id',
    name: 'eventCreateView'
    data: ->
         oneEvent = Events.findOne (this.params._id)
         if oneEvent isnt null && oneEvent isnt undefined
            console.log oneEvent.eventname
            Session.set 'eventName', oneEvent.eventname

    

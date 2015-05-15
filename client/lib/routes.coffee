Router.configure
    loadingTemplate: 'loading'
    waitOn: ->
        Meteor.subscribe 'currentuser'

requireLogin = ->
    if !Meteor.user()
        this.render 'login'
    else
        this.next()
#
Router.onBeforeAction requireLogin
 
Router.route '/',->
    this.render 'appMainView'

Router.route '/login', ->
  this.render 'login'

Router.route '/resetPassword', ->
    this.render 'resetPassword'

Router.route '/eventCreate',->
    this.render 'eventCreateView'

Router.route '/profile', ->
    this.render 'profile'

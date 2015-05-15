Router.route '/', ->
  this.render 'login'

Router.route '/main',->
    this.render 'appMainView'

Router.route '/resetPassword', ->
    this.render 'resetPassword'

Router.route '/eventCreate',->
    this.render 'eventCreateView'
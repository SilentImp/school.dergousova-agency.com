class Contacts
  constructor: ->
    @form = $ '#register-form'
    if @form.length == 0
      return

    @form.find(":input").inputmask();
    $('.mailus__send, .register-link').on 'click', @goToForm


  goToForm: (event)=>
    event.preventDefault()
    $(window).stop(true).scrollTo event.currentTarget.getAttribute('href'),
      duration: 1000
      interrupt: true


$(document).ready ->
  new Contacts

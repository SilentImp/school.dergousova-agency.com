class Contacts
  constructor: ->
    $('input, textarea').placeholder()

    @form = $ '#register-form'
    if @form.length == 0
      return

    @form.find(":input").inputmask();

    $('.mailus__send, .register-link').on 'click', @goToForm


  goToForm: (event)=>
    event.preventDefault()
    @scroller = new ScrollForIt
    @scroller.element document.getElementById(event.currentTarget.getAttribute('href').substring(1))

    # $('html, body').stop(true).scrollTo event.currentTarget.getAttribute('href'),
    #   duration: 1000
    #   interrupt: true


$(document).ready ->
  new Contacts


cl = document.querySelector('html').classList

if Modernizr.testProp 'mixBlendMode'
  cl.add 'mixBlendMode'
else
  cl.add 'no-mixBlendMode'

if Modernizr.testProp 'backgroundBlendMode'
  cl.add 'backgroundBlendMode'
else
  cl.add 'no-backgroundBlendMode'

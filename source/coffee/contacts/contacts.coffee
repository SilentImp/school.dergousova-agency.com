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

$(document).ready ->
  new Contacts


cl = document.querySelector('html')

if Modernizr.testProp 'mixBlendMode'
  cl.classList.add 'mixBlendMode'
else
  cl.classList.add 'no-mixBlendMode'

if Modernizr.testProp 'backgroundBlendMode'
  cl.classList.add 'backgroundBlendMode'
else
  cl.classList.add 'no-backgroundBlendMode'

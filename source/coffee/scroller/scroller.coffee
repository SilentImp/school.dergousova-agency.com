class Scroller
  constructor: ->
    @scroller = $ '.scroller'
    if @scroller.length == 0
      return false

    @items = @scroller.find '.scroller__item'
    @count = @items.length
    if @count < 3
      $('.scroller__navigation').remove()
      return

    if Modernizr.mq('(min-width: 650px)')
      @delta = 50
    else
      @delta = 100

    @wrapper = @scroller.find '.scroller__wrapper-inner'

    last = @scroller.find '.scroller__item:last'
    first = @scroller.find '.scroller__item:first'
    @wrapper.prepend last.clone(true).addClass 'cloned'
    @wrapper.append first.clone(true).addClass 'cloned'
    @wrapper.css
      'left' : '-'+@delta+'%'
    @step = 1

    @prev = @scroller.find '.scroller__prev'
    @next = @scroller.find '.scroller__next'

    @prev.on 'click', @getPrev
    @next.on 'click', @getNext
    $(window).on 'resize', @recalculate


  recalculate: =>
    if Modernizr.mq('(min-width: 650px)')
      @delta = 50
    else
      @delta = 100
    @wrapper.stop().css
      'left' : '-'+(@delta*@step)+'%'

  getPrev: (event)=>
    event.preventDefault()
    if @step == 0
      @step = @count
      @wrapper.stop().css
        'left' : '-'+(@delta*@step)+'%'
    @step--
    @wrapper.stop().animate
        'left' : '-'+(@delta*@step)+'%'
      ,
        duration: 500
        complete: =>
          if @step == 0
            @step = @count
            @wrapper.stop().css
              'left' : '-'+(@delta*@step)+'%'

  getNext: (event)=>
    event.preventDefault()
    if @step == @count
      @step = 0
      @wrapper.stop().css
        'left' : '-'+(@delta*@step)+'%'
    @step++
    @wrapper.stop().animate
        'left' : '-'+(@delta*@step)+'%'
      ,
        duration: 500
        complete: =>
          if @step == @count
            @step = 0
            @wrapper.stop().css
              'left' : '-'+(@delta*@step)+'%'

$(document).ready ->
  new Scroller

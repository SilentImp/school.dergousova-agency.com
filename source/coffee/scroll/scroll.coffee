class ScrollForIt
  constructor: ->
    @html = document.getElementsByTagName('html')[0]
    @scrolling = false
    @max_scroll_time = 1500
    @scroll_time_step = 250
    @scroll_px_step = 1000

  element: (element)=>

    @scrolling = true
    @html.classList.add 'scrolling'
    @startTime = parseInt new Date().getTime().toString().substr(-5), 10
    @startPos = window.pageYOffset
    @endPos = element.getBoundingClientRect().top
    @vector = 1
    if @endPos < @startPos
      @vector = -1
    @toScroll = Math.abs @endPos - @startPos
    @duration = Math.round @toScroll * @scroll_time_step / @scroll_px_step

    if @duration > @max_scroll_time
      @duration = @max_scroll_time

    @scrollPerMS = @toScroll / @duration
    @endTime = @startTime + @duration

    @loop()

  loop: =>
    if !@renderScroll()
      @scrolling = false
      @html.classList.remove 'scrolling'
      return
    return requestAnimationFrame(@loop)

  renderScroll: =>
    time = parseInt new Date().getTime().toString().substr(-5), 10
    if time > @endTime
      time = @endTime
    currentTime = time - @startTime

    window.scroll 0, Math.round((@vector * @scrollPerMS * currentTime) + @startPos)

    if @endTime <= time
      return false

    if window.pageYOffset == @endPos
      return false

    return true

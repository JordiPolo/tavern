jQuery ->
  if $('.post').lenght != 0
    new InfinitePager(".next a")

# Gets how to find the link to subsequent data and provides an infinite pager
class InfinitePager
  constructor: (@next_link) ->
    setTimeout(@checkScroll, 1000)
    # too overkill to ask for data constinously and get duplicates
    #$(window).scroll(@checkScroll)

  checkScroll: =>
    if( @nearBottomOfPage() )
      if( @existsMoreData() )
        $.rails.handleRemote(@nextData())
    setTimeout(@checkScroll, 250)

  existsMoreData: =>
    $(@next_link).length != 0

  nextData: =>
    $(@next_link)

  nearBottomOfPage: =>
    $(window).scrollTop() > $(document).height() - $(window).height() - 150

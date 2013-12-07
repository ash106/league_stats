$ ->
  $("#new_summoner").submit (event) ->
    $('#loading').show()

  $("#update_history").click (event) ->
    event.preventDefault()
    alert "You clicked da button!"
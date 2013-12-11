$('.no_games').remove()
$('#loading').hide()
$('#match_history').html '<%= render @games %>'
$('#match_history').show()
<% if @summoner.valid? %>
  $('.no_summoners').remove()
  $('#loading').hide()
  $('#summoners').prepend '<%= render @summoner %>'
<% else %>
  $('#loading').hide()
  $('#summoners').prepend '<p>ERROR ERROR ERROR</p>'
<% end %>
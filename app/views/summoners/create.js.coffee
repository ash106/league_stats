<% if @summoner.valid? %>
  # $('.empty_summoners').remove()
  $('#loading').hide()
  $('#summoners').prepend '<p><%= link_to @summoner.name, summoner_path(@summoner.server, @summoner.name) %> (<%= @summoner.server %>)</p>'
<% else %>
  $('#loading').hide()
  $('#summoners').prepend '<p>ERROR ERROR ERROR</p>'
<% end %>
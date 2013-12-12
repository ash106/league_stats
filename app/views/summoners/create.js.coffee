<% if @summoner.valid? %>
  $('.no_summoners').remove()
  $('#loading').hide()
  $('#summoners').prepend '<div class="summoner panel radius"><h3 class="small-3"><%= link_to @summoner.name.titleize, summoner_path(@summoner.server, @summoner.name) %></h3><p>Server: <%= @summoner.server.upcase %> | Level: <%= @summoner.level %></p></div>'
<% else %>
  $('#loading').hide()
  $('#summoners').prepend '<p>ERROR ERROR ERROR</p>'
<% end %>
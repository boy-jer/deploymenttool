# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/



jQuery ->
  $('.best_in_place').best_in_place()

  $(':checkbox').live('click', ->
    $(this).closest('form').submit())

  $("#body").prepend('<%= escape_javascript(render \'campaign/new.html.erb\') %>');

  $('div#new_campaign').live 'click', ->
    $('div.form').show()
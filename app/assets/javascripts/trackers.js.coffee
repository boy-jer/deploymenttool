# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/


jQuery ->

  # Fill the Tracker with an empty search to return all campaigns.
  $(document).ready ->
    search_tracker('')

  $(".campaign").live 'click', ->


  search_tracker = (input) ->
    url = '/trackers/search'
    input = { user_input: input }
    $.get url, input, (html)->
      $('#search_results').html(html)

  $('input#search_tracker').bind 'keyup', ->
    input = $('input#search_tracker').closest('input').val()
    search_tracker input

  $('input#search_tracker').bind 'focus', ->
      $(this).attr('class', 'on');
  
  $('input#search_tracker').bind 'blur', ->
      $(this).attr('class', 'off');
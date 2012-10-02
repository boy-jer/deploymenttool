# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  # Fill the Contacts with an empty search to return all campaigns.
  $(document).ready ->
    search_contacts('')

  search_contacts = (input) ->
    url = '/contacts/search'
    input = { user_input: input }
    $.get url, input, (html)->
      $('div#contacts_search_results').html(html)

  $('input#search_contacts').bind 'keyup', ->
    input = $(this).val()
    search_contacts input
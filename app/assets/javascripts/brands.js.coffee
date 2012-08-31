# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $('div#brands_index ul li').mouseover ->
    $('input', this).show()
  $('div#brands_index ul li').mouseout ->
    $('input', this).hide()


  $('ul.deletable li').mouseover ->
    $('input', this).show()
  $('ul.deletable li').mouseout ->
    $('input', this).hide()
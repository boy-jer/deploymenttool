# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->

  $('div.deletable').live 'mouseover', ->
    $('input.delete', this).show()
  $('div.deletable').live 'mouseout', ->
    $('input.delete', this).hide()
    

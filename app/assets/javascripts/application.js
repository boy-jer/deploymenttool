// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery-ui
//= require best_in_place
//= require_tree .

$(document).ready(function() {
  /* Activating Best In Place */
  jQuery(".best_in_place").best_in_place();
  
  $("input#send_lists_contact_contact_id").bind("keyup", function() {
    var form = $("input#send_lists_contact_contact_id").closest("form"); // Grab the Entire Form.
    var url = "/contacts/search"; // The Controller URL for returning Data. 
    var formData = form.serialize(); // The Data in the Form.
  
    $.get(url, formData, function(html) { // perform an AJAX get
      $("#search_results").html(html); // replace the "results" div with the results=
    });
    
    $("#search_results").show();
  
  });  
  
  $("div#search_box li").live("click", function() {
    //$(this).children('form').submit();
    $('form',this).submit()
  });
  
  
  
  
  // Tracker Search
  $("input#search_tracker").bind("keyup", function() {
    var form = $("input#search_tracker").closest("form"); // Grab the Entire Form.
    var url = "/trackers/search"; // The Controller URL for returning Data. 
    var formData = form.serialize(); // The Data in the Form.
  
    $.get(url, formData, function(html) { // perform an AJAX get
      $("#search_results").html(html); // replace the "results" div with the results=
    });
  
  });  
  
  
  
  
  
  
  
});
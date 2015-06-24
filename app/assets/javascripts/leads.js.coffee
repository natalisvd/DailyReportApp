# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('#from').datepicker
    changeMonth: true
    dateFormat: 'yy, mm, dd'
    numberOfMonths: 1
    onClose: (selectedDate) ->
      $('#to').datepicker 'option', 'minDate', selectedDate
      return
  $('#to').datepicker
    minDate: new Date(2015, 0, 1)
    defaultDate: '+2d'
    dateFormat: 'yy, mm, dd'
    changeMonth: true
    numberOfMonths: 1
    onClose: (selectedDate) ->
      $('#from').datepicker 'option', 'maxDate', selectedDate
      return

  $("select").multiselect();


  $("select#business_entity").multiselect("widget").find(":checkbox").on('change',
    ->
      $("#business_entity_name").val($("select#business_entity").multiselect("getChecked").map(->@value).get())
  )
  $("select#lead_source").multiselect("widget").find(":checkbox").on('click',
    ->
      $("#lead_source_list").val($("select#lead_source").multiselect("getChecked").map(->@value).get())
#      console.log $("select#lead_source").multiselect("getChecked").map(->@value).get()
  )
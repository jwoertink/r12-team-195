//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require_self

$(function() {
  grid_sort();
});

var grid_sort = function() {
  if($('#sort-grid').length > 0) {
    $('#sort-grid').quicksand()
  }
}
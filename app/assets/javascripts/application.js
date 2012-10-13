//= require jquery
//= require jquery-ui
//= require jquery_ujs
//= require autocomplete-rails
//= require twitter/bootstrap
//= require easing
//= require quicksand
//= require_self

$(function() {
  grid_sort();
  rate();
  live_feed();
});

var rate = function() {
  if($('a[rel^=rate]').length > 0) {
    $('a[rel^=rate]').click(function() {
      $.ajax({
        type: 'post',
        dataType: 'script',
        data: { feeling: $(this).data('feeling') },
        url: $(this).attr('href')
      });
      return false;
    });
  }
}

var grid_sort = function() {
  var grid = $('#sort-grid');
  var grid_clone = grid.clone();
  
  if(grid.length > 0) {
    $('.sort-actions a').click(function() {
      var value = $(this).data('value');
      if(value == 'all') {
        var sorted_data = grid_clone.find('li').sorted({
          by: function(li) {
            return $(li).data('kind').toLowerCase();
          }
        });
      } else {
        var sorted_data = grid_clone.find('li[data-kind='+value+']').sorted({
          by: function(li) {
            return $(li).data('kind').toLowerCase();
          }
        });
      }
      
      grid.quicksand(sorted_data, {
        duration: 800,
        easing: 'easeInOutQuad'
      });
      return false
    });
    
  }
}

var live_feed = function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  faye.subscribe("/data-updates", function(data) {
    eval(data);
  });
}

$.fn.sorted = function(customOptions) {
  var options = {
    reversed: false,
    by: function(a) { return a.data('kind'); }
  };
  $.extend(options, customOptions);
  $data = $(this);
  arr = $data.get();
  arr.sort(function(a, b) {
    var valA = options.by($(a));
    var valB = options.by($(b));
    if (options.reversed) {
      return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;				
    } else {		
      return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;	
    }
  });
  return $(arr);
};
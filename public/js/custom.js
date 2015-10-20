$(document).ready(function(){

  $(".fa.fa-cogs").click(function(){
    $(".modal.range-slider").modal();
  });

  $( "#range-slider" ).slider({
      range: "max",
      min: 100,
      max: 300,
      value: 50,
      slide: function( event, ui ) {
        $( "#amount span" ).text( ui.value );
      }
    });
  $("#apply-filter").click(function() {
    var deal_price = $("#amount span").text()
    $.ajax({
      type: "POST",
      url: "/filter",
      data: { deal_price: deal_price },
      success: function(data){
        var container = $(".offers-content");
        container.empty();
        container.html(data);
      }
    });
    $.modal.close();
    });
});

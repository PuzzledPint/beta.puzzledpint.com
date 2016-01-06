(function( $ ) {
  function populateStateSelect(country, state) {
    $.getJSON("/countries/" + country.value + "/subdivisions",
        function( data ) {
          var options = "<option value></option>";

          for(var i = 0; i < data.length; i++) {
            options += '<option value="' + data[i].code + '">' + data[i].name + '</option>'
          }

          // populate select
          state.innerHTML = options;

          //toggle disabled status
          var disabled = options == "<option value></option>";
          state.disabled = disabled;
        });
  }

  $.fn.countryStateSelect = function() {
    //Initialize state
    var country = this[0];

    var state = $("select.state", $(country).parents().next())[0];
    state.disabled = country.value == "";

    this.change( function(e) {
      var country = this;
      var state = $("select.state", $(country).parents().next())[0];
      populateStateSelect(country, state);

      //deselected selected state
      state.selectedIndex = 0;
      $(state).select2("val", "");
    });

    return this;
  };

}( jQuery ));

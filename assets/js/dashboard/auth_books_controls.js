$( document ).ready( function() {
    // Show output requests tab
    $( "#output-trade-req-btn" ).click( function() {
        if ( $( "#output-trade-req-div" ).hasClass( "hidden" ) ) {
            $( "#input-trade-req-div" ).addClass( "hidden" );
            $( "#output-trade-req-div" ).removeClass( "hidden" );
        } else {
            $( "#output-trade-req-div" ).addClass( "hidden" );
        }
    });
    // Show input requests tab (both pending and accepted)
    $( "#input-trade-req-btn" ).click( function() {
        if ( $( "#input-trade-req-div" ).hasClass( "hidden" ) ) {
            $( "#output-trade-req-div" ).addClass( "hidden" );
            $( "#input-trade-req-div" ).removeClass( "hidden" );
        } else {
            $( "#input-trade-req-div" ).addClass( "hidden" );
        }
    });     
    
    // AJAX - Accept trade request
    $( "button.accept" ).click( function() {
        var parent = $( this ).parent();
        var id = parent.find( "span.id.hidden-data" ).html();
        $.ajax({
            type: "POST",
            url: "ajax-do-trade-book",
            dataType: "text",
            data: {
                id: id,
                command: 'accept'
            },
            success: function(result) {
                //alert(result);
                location.href = '';
            },
            error: function(xhr, status, error) {
                //alert(error);
            }
        });
    });   
    // AJAX - Cancel trade request
    $( "button.cancel" ).click( function() {
        var parent = $( this ).parent();
        var id = parent.find( "span.id.hidden-data" ).html();
        $.ajax({
            type: "POST",
            url: "ajax-do-trade-book",
            dataType: "text",
            data: {
                id: id,
                command: 'cancel'
            },
            success: function(result) {
                //alert(result);
                location.href = '';
            },
            error: function(xhr, status, error) {
                //alert(error);
            }
        });
    });     
});
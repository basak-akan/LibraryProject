$( document ).ready(function() {

    var url = window.location;

    // SUBMIT FORM
    $("#addbook").submit(function(event) {
        // Prevent the form from submitting via the browser.
        event.preventDefault();
        ajaxPost();
    });


    function ajaxPost(){

        // PREPARE FORM DATA
        var formData = {
            name : $("#name").val(),
            author :  $("#author").val(),
            date : $("#date").val()
        }

        // DO POST
        $.ajax({
            type : "POST",
            contentType : "application/json",
            url : url + "/",
            data : JSON.stringify(formData),
            dataType : 'json',
            success : function(result) {
                alert("Success!");
                console.log(result);
            },
            error : function(e) {
                alert("Error!")
                console.log("ERROR: ", e);
            }
        });

        // Reset FormData after Posting
        resetData();

    }

    function resetData(){
        $("#name").val("");
        $("#author").val("");
        $("#date").val("");
    }
})

$( document ).ready(function() {

    var url = window.location;


    $("#addbook").submit(function(event) {

        event.preventDefault();
        ajaxPost();
    });




    function ajaxPost(){


        var formData = {
            name : $("#name").val(),
            author :  $("#author").val(),
            date : $("#date").val()
        }


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


        resetData();

    }

    function resetData(){
        $("#name").val("");
        $("#author").val("");
        
    }
})

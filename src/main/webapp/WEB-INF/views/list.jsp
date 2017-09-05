<%--
  Created by IntelliJ IDEA.
  User: Başak
  Date: 21.08.2017
  Time: 18:08
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Carousel Template for Bootstrap</title>

    <!-- jquery kütüphanesinin eklenen ilk kütüphane olması gerekiyormuş -->
    <script language="JavaScript" type="text/javascript" src="/resources/js/jquery-3.2.1.min.js"></script>

    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/carousel.css" />" rel="stylesheet">

    <!-- Js grid cdn'leri -->
    <link type="text/css" rel="stylesheet" href="/resources/css/jsgrid.min.css" />
    <link type="text/css" rel="stylesheet" href="/resources/css/jsgrid-theme.min.css" />

    <script type="text/javascript" src="/resources/js/jsgrid.min.js"></script>

</head>
<body>
<div class="navbar-wrapper">
    <div class="container">

        <nav class="navbar navbar-inverse navbar-static-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="/home/">Library System Project</a>
                </div>
                <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                        <li><a href="/add/">Add Book</a></li>
                        <li class="active"><a href="/list/">List Books</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>

<div><br><br><br><br></div>

<div class="container">


    <div id="jsGrid" modelattribute="${list}" method="post" action="/list/"></div>

    <script>
        var db = {
            loadData: function (filter) {
                return $.grep(this.booklist, function (book) {
                    return (!filter.id || book.id.indexOf(filter.id) > -1)
                        && (!filter.name || book.name.indexOf(filter.name) > -1)
                        && (!filter.author || book.author.indexOf(filter.author) > -1)
                        && (!filter.date || book.date.indexOf(filter.date));
                });
            },

//            updateItem: function(updatingBook){},

            updateItem: function (item) {
                 $.ajax({
                    type: "POST",
                    url: "/list/",
                    data: item,
                    success: function (result) {
                        console.log(item);
                    },
                    error: function (e) {
                        alert("Error!")
                        console.log("ERROR: ", e);
                        console.log(item);
                    }
                });

            }
        }

        var MyCustomDirectLoadStrategy = function(grid) {
            jsGrid.loadStrategies.DirectLoadingStrategy.call(this, grid);
        };

        MyCustomDirectLoadStrategy.prototype = new jsGrid.loadStrategies.DirectLoadingStrategy();


        MyCustomDirectLoadStrategy.prototype.finishDelete = function(deletedItem, deletedItemIndex) {
            var grid = this._grid;
            grid.option("data").splice(deletedItemIndex, 1);
            grid.refresh();

            $.ajax({
                type: "POST",
                url: "/list/",
                data: deletedItem,
                success : function(result) {
                    console.log(result);
                },
                error : function(e) {
                    alert("Error!")
                    console.log("ERROR: ", e);
                }
            });
            console.log("Ajax posttan çıktı.");
        };


//        update deneme işlemi..
//        MyCustomDirectLoadStrategy.prototype.updateItem= function(item, editedItem) {
//            var grid = this._grid;
//
//            grid.refresh();
//
//            $.ajax({
//                type: "POST",
//                url: "/list/",
//                data: item,
//                success : function(result) {
//                    console.log(result);
//                },
//                error : function(e) {
//                    alert("Error!")
//                    console.log("ERROR: ", e);
//                }
//            });
//            console.log("Ajax posttan çıktı.");
//        };



        window.db = db;

        db.booklist = ${list};


//        var baseEditItem = jsGrid.Grid.prototype.editItem;
//
//        jsGrid.Grid.prototype.editItem = function() {
//            console.log("editItem ın içinde ");
//            if(this._editingRow) {
//                console.log("if'e girdi.");
//                this.updateItem();
//                console.log("Edited item : ", editedItem);
//            }
//            console.log("if'den çıktı.");
//            baseEditItem.apply(this, arguments);
//        };


        $("#jsGrid").jsGrid({
            width: "100%",
            height: "400px",

            filtering: true,
            editing: true,
            sorting: true,
            paging: true,
            autoload: true,
            pageButtonCount: 5,

            deleteConfirm: "Do you really want to delete the book?",

//            rowClick: function(args) {
//
//                console.log("row clicked")
//            },

            controller: db,

            loadStrategy: function() {
                return new MyCustomDirectLoadStrategy(this);
            },

            fields: [
                { name: "id", type: "number", width: 50, editing: false, validate: "required" },
                { name: "name", type: "text", width: 150 },
                { name: "author", type: "text", width: 100 },
                { name: "date", type: "text", width: 200 },
                { type: "control", editButton: false}
            ]

        });



    </script>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"><\/script>')</script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

</body>
</html>

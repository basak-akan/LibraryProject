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

    <!-- AJAX post js dosyasının path'ı -->
    <script src="<c:url value="/resources/js/ajaxpost.js"/>"></script>


    <!-- Bootstrap core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
    <!-- Jquery lib -->
    <script src="http://code.jquery.com/jquery-1.9.1.js"></script>

    <!-- Custom styles for this template -->
    <link href="<c:url value="/resources/css/carousel.css" />" rel="stylesheet">
    <style>

    #newBookContainer {
        top: inherit;

    }

    </style>

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
                        <li class="active"><a href="/add/">Add Book</a></li>
                        <li><a href="/list/">List Books</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    </div>
</div>
<div><br><br><br><br><br><br><br></div>
<!-- Yeni kitap ekleme formu -->
<div class="container">
    <div class="row main">
        <div class="main-center container">
            <legend>Library System:</legend>
        </div>
        <!-- form -->
        <form id="addbook" class="addbook" method="post" action="/add/" modelAttribute="book" >
            <div class="col-sm-5">
                <h4>Add a book:</h4>
                <div class="panel panel-default">
                    <div class="panel-body form-horizontal">


                        <div class="form-group">
                            <label  class="col-sm-3 control-label">Name</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-sm-3 control-label">Author</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="author" name="author">
                            </div>
                        </div>

                        <div class="form-group">
                            <label for="date" class="col-sm-3 control-label">Publish Date</label>
                            <div class="col-sm-9">
                                <input type="date" class="form-control" id="date" name="date">
                            </div>
                        </div>

                        <div class="form-group">
                            <div class="col-sm-12 text-right">
                                <button type="submit" id="btn-save" class="btn btn-default preview-add-button">
                                    <span class="glyphicon glyphicon-plus"></span> Add Book
                                </button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="<c:url value="/resources/js/jquery-1.11.3.min.js"/>"><\/script>')</script>
<script src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>View ToDo Item List</title>
    <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

    <style>
		html, body {
		    height: 100%;      /* Ensures the body takes the full height of the viewport */
		    margin: 0;        /* Removes default margin */
		}

		.content {
		    min-height: calc(100vh - 50px); /* Adjust this value to the height of your footer */
		    padding-bottom: 50px; /* Prevents content from being hidden behind the footer */
		}

		.footer {
		    background-color: #333; /* Background color of the footer */
		    color: white;           /* Text color of the footer */
		    text-align: center;     /* Center text */
		    padding: 7px 0;       /* Padding for top and bottom */
		    position: fixed;        /* Fixed position */
		    bottom: 0;              /* Positions it at the bottom of the viewport */
		    left: 0;                /* Aligns it to the left */
		    right: 0;               /* Aligns it to the right */
		    width: 100%;           /* Ensures it spans the full width of the page */
		}
        a{
            color: white;
        }
        a:hover {
            color: white;
            text-decoration: none;
        }
		body
		{
			background-image: linear-gradient(to right, rgb(234, 222, 219) 0%, rgb(188, 112, 164) 50%, rgb(191, 214, 65) 75%);
			
		}
		.footer {
		    background-color: #333; /* Background color of the footer */
		    color: white;           /* Text color of the footer */
		    text-align: center;     /* Centered text */
		    padding: 15px 0;       /* Padding for top and bottom */
		    position: relative;     /* Relative positioning */
		    bottom: 0;
		    width: 100%;
		}
    </style>

</head>
<body>
	<div class="content">
	   
    <div class="container">

        <h1 class="p-3"> ToDo Item List</h1>

        <form:form>

            <table class="table table-bordered">
            	<tr>
            		<th>Id</th>
            		<th>Title</th>
            		<th>Date</th>
            		<th>Status</th>
            		<th>Mark Completed</th>
            		<th>Edit</th>
            		<th>Delete</th>
            	</tr>

            	<c:forEach var="todo" items="${list}">
                    <tr>
                		<td>${todo.id}</td>
                		<td>${todo.title}</td>
                		<td>${todo.date}</td>
                		<td>${todo.status}</td>
                		<td><button type="button" class="btn btn-success">
                		    <a href="/updateToDoStatus/${todo.id}">Mark Complete</a>
                		</button></td>
                		<td><button type="button" class="btn btn-primary">
                		    <a href="/editToDoItem/${todo.id}">Edit</a>
                		</button></td>
                		<td><button type="button" class="btn btn-danger">
                			<a href="/deleteToDoItem/${todo.id}">Delete</a>
                		</button></td>
                	</tr>

            	</c:forEach>

            </table>

        </form:form>

        <button type="button" class="btn btn-primary btn-block">
        	<a href="/addToDoItem">Add New ToDo Item</a>
        </button>

    </div>

    <script th:inline="javascript">
                window.onload = function() {

                    var msg = "${message}";
                    
                    if (msg == "Save Success") {
        				Command: toastr["success"]("Item added successfully!!")
        			} else if (msg == "Delete Success") {
        				Command: toastr["success"]("Item deleted successfully!!")
        			} else if (msg == "Delete Failure") {
        			    Command: toastr["error"]("Some error occurred, couldn't delete item")
        			} else if (msg == "Edit Success") {
        				Command: toastr["success"]("Item updated successfully!!")
        			}

        			toastr.options = {
                          "closeButton": true,
                          "debug": false,
                          "newestOnTop": false,
                          "progressBar": true,
                          "positionClass": "toast-top-right",
                          "preventDuplicates": false,
                          "showDuration": "300",
                          "hideDuration": "1000",
                          "timeOut": "5000",
                          "extendedTimeOut": "1000",
                          "showEasing": "swing",
                          "hideEasing": "linear",
                          "showMethod": "fadeIn",
                          "hideMethod": "fadeOut"
                        }
        	    }
            </script>
		</div>	
		<footer class="footer">
		        <p>&copy; 2024 Avinash Chidurala. All rights reserved.&emsp;&emsp;&emsp;<a href="mailto:chiduralaavinash@gmail.com">chiduralaAvinash@gmail.com</a></p>
				
		    </footer>       

</body>

</html>
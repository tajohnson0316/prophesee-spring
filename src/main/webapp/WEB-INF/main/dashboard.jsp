<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 6/19/2023
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- c:out ; c:forEach etc. -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>

<html data-bs-theme="dark">
<head>
  <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
  <script type="text/javascript" src="/js/app.js"></script>
  
  <%-- TODO: PAGE TITLE --%>
  <title>Title</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <%-- TODO: NAVBAR BRAND --%>
    <a href="/dashboard" class="navbar-brand fs-3">
      Application
    </a>
    <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarNav"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a href="/dashboard" class="nav-link">
            Home
          </a>
        </li>
      </ul>
      <a href="/logout" class="btn btn-outline-danger" role="button">
        Log Out
      </a>
    </div>
  </div>
</nav>
<div class="container p-5">
  <%-- TODO: WELCOME HEADER --%>
  <h1 class="mb-3">Welcome, ${username}!</h1>
  <div class="d-flex justify-content-between">
    <%-- TODO: TABLE DESCRIPTION --%>
    <p>Table description:</p>
    <a href="#" class="btn btn-outline-success mb-3" role="button">
      + New Item
    </a>
  </div>
  <div class="d-flex justify-content-center">
    <div class="card w-100">
      <div class="card-body">
        <table class="table table-striped table-bordered">
          <thead>
          <tr>
            <%-- TODO: COLUMN NAMES HERE --%>
            <th scope="col">Column 1</th>
            <th scope="col">Actions</th>
          </tr>
          </thead>
          <tbody>
          <c:forEach var=" " items="${platforms}">
            <tr>
                <%-- TODO: COLUMN DATA HERE --%>
              <td>Column 1 data</td>
                <%-- VIEW | EDIT | DELETE --%>
              <td>
                <div class="d-flex justify-content-center">
                  <form action="#" method="post">
                    <div class="btn-group" role="group">
                      <a href="#" class="btn btn-primary">
                        View
                      </a>
                      <a href="#" class="btn btn-warning">
                        Edit
                      </a>
                      <input type="hidden" name="_method" value="delete">
                      <button type="submit" class="btn btn-danger">Delete</button>
                    </div>
                  </form>
                </div>
              </td>
            </tr>
          </c:forEach>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
</body>
</html>
<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 7/25/2023
  Time: 6:06 AM
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
  
  <title>PropheSee - Add Platform</title>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand fs-3" href="/dashboard">PropheSee</a>
    <button
        class="navbar-toggler"
        type="button"
        data-bs-toggle="collapse"
        data-bs-target="#navbarSupportedContent"
        aria-controls="navbarSupportedContent"
        aria-expanded="false"
        aria-label="Toggle navigation"
    >
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="/dashboard"
          >Dashboard</a
          >
        </li>
        <!-- Your Platforms dropdown START -->
        <li class="nav-item dropdown">
          <a
              class="nav-link dropdown-toggle"
              role="button"
              data-bs-toggle="dropdown"
              aria-expanded="false"
          >
            Your Platforms
          </a>
          <!-- Your Platforms dropdown list START -->
          <ul class="dropdown-menu">
            <c:forEach var="platform" items="${platforms}">
              <!-- TODO: Platform hrefs -->
              <li>
                <a href="#" class="dropdown-item">
                    ${platform.name}
                </a>
              </li>
            </c:forEach>
            <li>
              <hr class="dropdown-divider">
            </li>
            <li>
              <a href="/watchlist/platforms/new" class="dropdown-item">
                Add New Platform
              </a>
            </li>
          </ul>
        </li>
        <!-- Your Platforms dropdown END -->
        
        <!-- Edit Profile nav item START -->
        <%-- TODO: Edit Profile href --%>
        <li class="nav-item">
          <a class="nav-link" href="#">Edit Profile</a>
        </li>
      </ul>
      
      <!-- TODO: About href -->
      <a class="nav-link mx-3" aria-current="page" href="#">About</a>
      <a class="btn btn-danger" href="/logout" role="button">Log Out</a>
    </div>
  </div>
</nav>

<main class="container d-flex justify-content-center p-5">
  <div class="card col-lg-8">
    <div class="card-header">
      <h1>Add New Platform</h1>
    </div>
    <!-- TODO: Platform FORM ACTION here -->
    <!-- TODO: Refactor forM for JSP -->
    <form:form action="#" method="POST">
      <div class="card-body" id="card_body">
        <div class="list-group list-group-flush">
          <div class="list-group-item">
            <div class="mb-3">
              <label for="platform_name" class="form-label">
                Platform name: *
              </label>
              <input
                  class="form-control"
                  type="text"
                  name="platform_name"
                  id="platform_name"
              />
            </div>
            <div class="mb-3">
              <label for="homepage_link" class="form-label">
                Link to Homepage:
              </label>
              <input
                  class="form-control"
                  type="text"
                  name="homepage_link"
                  id="homepage_link"
              />
            </div>
          </div>
        </div>
      </div>
      <div class="card-footer">
        <p class="d-flex justify-content-end">
          * Denotes required field
        </p>
        <div class="d-flex justify-content-end gap-3">
          <button
              type="submit"
              class="btn btn-success"
              id="submit_button"
              disabled
          >
            Add platform
          </button>
          <a
              href="/dashboard"
              type="button"
              class="btn btn-danger"
              id="cancel"
          >
            Cancel
          </a>
        </div>
      </div>
    </form:form>
  </div>
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous">
</script>
</body>
</html>
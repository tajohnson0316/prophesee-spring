<%--
  Created by IntelliJ IDEA.
  User: arman
  Date: 7/28/2023
  Time: 2:52 PM
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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <script type="text/javascript" src="/js/app.js"></script>
  
  <title>PropheSee - Add Media</title>
</head>

<body>
<!-- Navbar START -->
<nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand fs-3" href="/dashboard">
      PropheSee
    </a>
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
          <a class="nav-link" aria-current="page" href="/dashboard">
            Dashboard
          </a>
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
              <a href="/watchlist/platforms/new" class="dropdown-item text-success">
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
<!-- Active user navbar END -->

<main class="container d-flex justify-content-center p-5">
  <div class="card col-lg-8">
    <div class="card-header">
      <h1>Add New Media</h1>
    </div>
    <!-- TODO: Add media FORM ACTION here -->
    <form:form action="#" method="post" modelAttribute="media">
      <div class="card-body">
        <div id="card_content">
          <!-- Media name field START -->
          <div class="mb-3">
            <form:label path="title" class="form-label">
              Media title: *
            </form:label>
            <form:input
                path="title"
                type="text"
                id="media_name"
                name="media_name"
                class="form-control"
            />
            <p class="text-danger">
              <form:errors path="title"/>
            </p>
          </div>
          <!-- Media title field END -->
          
          <!-- Category field START -->
          <div class="mb-3">
            <form:select
                path="category"
                name="category"
                id="category"
                class="form-select"
            >
              <option value="" selected>Category *</option>
              <option value="Series">Series</option>
              <option value="Movie/Documentary">Movie/Documentary</option>
              <option value="Miscellaneous">Miscellaneous</option>
            </form:select>
          </div>
          <!-- Category field END -->
          
          <!-- Platform field START -->
          <div class="mb-3">
            <form:select
                path="platform"
                name="platform_name"
                id="platform_name"
                class="form-select"
            >
              <option value="">Platform *</option>
              <!-- TODO: List all available platforms -->
              <c:forEach var="platform" items="${platforms}">
                <form:option value="${platform.id}">
                  ${platform.name}
                </form:option>
              </c:forEach>
            </form:select>
          </div>
          <!-- Platform field END -->
          
          <!-- Currently watching field START -->
          <div class="mb-3">
            <div class="form-check form-switch">
              <input
                  checked
                  class="form-check-input"
                  type="checkbox"
                  role="switch"
                  id="is_watching"
                  name="is_watching"
              />
              <label class="form-check-label" for="is_watching">
                Currently watching
              </label
              >
            </div>
          </div>
          <!-- Currently watching field END -->
          
          <!-- Currently airing field START -->
          <div id="is_airing_block" class="mb-3">
            <div class="form-check form-switch">
              <input
                  checked
                  class="form-check-input"
                  type="checkbox"
                  role="switch"
                  id="is_airing"
                  name="is_airing"
              />
              <label class="form-check-label" for="is_airing">
                Currently airing
              </label>
            </div>
          </div>
          <!-- Currently airing field END -->
          
          <!-- Total seasons field START -->
          <div id="total_seasons_block" class="mb-3">
            <label for="media_name" class="form-label">
              Total Seasons: *
            </label
            >
            <input
                type="number"
                min="1"
                max="999"
                value="1"
                id="total_seasons"
                name="total_seasons"
                class="form-control"
            />
          </div>
          <!-- Total seasons field END -->
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
            Add media
          </button>
          <a
              href="/home/unlisted"
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
</body>
</html>
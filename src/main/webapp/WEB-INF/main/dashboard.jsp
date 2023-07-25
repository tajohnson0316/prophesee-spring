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
<!-- Active user navbar START -->
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
            <!-- TODO: Platforms dropdown menu items -->
            <li>
              <a class="dropdown-item" href="#">Action</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Another action</a>
            </li>
            <li>
              <a class="dropdown-item" href="#">Yet another action</a>
            </li>
          </ul>
        </li>
        <!-- Your Platforms dropdown END -->
        
        <!-- Edit Profile nav item START -->
        <li class="nav-item">
          <a class="nav-link" href="#">Edit Profile</a>
        </li>
      </ul>
      
      <!-- TODO: About link/href -->
      <a class="nav-link mx-3" aria-current="page" href="#">About</a>
      <a class="btn btn-danger" href="/logout" role="button">Log Out</a>
    </div>
  </div>
</nav>
<!-- Active user navbar END -->

<!-- Main START -->
<main class="container-fluid d-flex justify-content-between gap-5 p-4">
  <!-- Quick Add card START -->
  <div class="card col-lg-2 h-50 sticky-top z-0">
    <!-- TODO: User's first name -->
    <div class="card-header text-center"><h2>${username}'s Watchlist</h2></div>
    <%-- TODO: Refactor form for JSP --%>
    <form action="#" method="POST">
      <div class="card-body">
        <div>
          <!-- TODO: Add media FORM ACTION here -->
          <div class="mb-3">
            <div class="d-flex justify-content-between align-items-end">
              <label for="media_name" class="form-label"
              >Media Name: *</label
              >
              <p class="text-decoration-underline fs-4">+ Quick Add</p>
            </div>
            <input
                type="text"
                id="media_name"
                name="media_name"
                class="form-control"
            />
          </div>
          <div class="mb-3">
            <select
                name="category"
                id="category"
                class="form-select"
            >
              <option value="Category" selected>Category *</option>
              <option value="Series">Series</option>
              <option value="Movie/Documentary">Movie/Documentary</option>
              <option value="Miscellaneous">Miscellaneous</option>
            </select>
          </div>
          <div class="mb-3">
            <select
                name="platform_name"
                id="platform_name"
                class="form-select"
            >
              <option value="Platform" selected>Platform *</option>
              <!-- TODO: List all available platforms -->
              <option value="Unlisted">Unlisted</option>
            </select>
          </div>
        </div>
      </div>
      <div class="card-footer">
        <p class="d-flex justify-content-end">* Denotes required field</p>
        <div class="d-flex justify-content-between align-items-end">
          <a href="/dashboard" id="view_all_link">View all media</a>
          <button
              type="submit"
              class="btn btn-success"
              id="quick_add_submit_button"
              disabled
          >
            Add Media
          </button>
        </div>
      </div>
    </form>
  </div>
  <!-- Quick Add card END -->
  
  <div>
    <div class="d-flex justify-content-between">
      <div>
        <h1>
          <!-- TODO: Current tab name instead of "unlisted" -->
          <!-- TODO: Current tab href here -->
          <a class="text-decoration-none" href="#"
          >Unlisted</a
          >
          - Sneak Peek
        </h1>
      </div>
      <div>
        <!--TODO: Add media to platform button href here -->
        <!--TODO: Add media to "Platform Name" button href here -->
        <a
            href="#"
            class="btn btn-outline-success text-wrap"
            role="button"
        >Add new media to Unlisted</a
        >
      </div>
    </div>
    <!-- Dashboard card START -->
    <div class="card">
      <!-- Dashboard header START -->
      <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs justify-content-start">
          <!-- TODO: List user's platforms -->
          <!-- TODO: Dashboard card tabs hrefs here -->
          <li class="nav-item">
            <a href="#" class="nav-link">Home</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">Hulu</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">Netflix</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">Disney+</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link active">Unlisted</a>
          </li>
          <li class="nav-item">
            <a href="#" class="nav-link">( + )</a>
          </li>
        </ul>
      </div>
      <!-- Dashboard header END -->
      
      <!-- Dashboard body START -->
      <div class="card-body">
        <!-- 1st row START -->
        <div class="row">
          <div class="d-flex justify-content-around gap-3 p-2">
            <!-- Recently Added table START -->
            <div class="col-lg-5">
              <h3>Recently Added</h3>
              <table
                  class="table table-hover table-bordered table-striped table-fixed"
              >
                <thead>
                <tr>
                  <th></th>
                  <th scope="col">Title</th>
                  <th scope="col">Added</th>
                  <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- TODO: List user's platform media -->
                <tr>
                  <th scope="row">1</th>
                  <td>District 9</td>
                  <td>2023-04-27</td>
                  <td>
                    <div class="d-flex justify-content-center gap-3">
                      <a href="#">View</a>
                      <span> | </span>
                      <a href="#">Edit</a>
                      <span> | </span>
                      <a href="#">To Platform</a>
                    </div>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <!-- Recently Added table END -->
            
            <!-- Recently Added table START -->
            <div class="col-lg-5">
              <h3>Currently Watching</h3>
              <table
                  class="table table-hover table-bordered table-striped table-fixed"
              >
                <thead>
                <tr>
                  <th></th>
                  <th scope="col">Title</th>
                  <th scope="col">Last Updated</th>
                  <th scope="col">Actions</th>
                </tr>
                </thead>
                <tbody>
                <!-- TODO: List user's platform media -->
                <tr>
                  <th scope="row">1</th>
                  <td>Chainsaw Man</td>
                  <td>2023-04-27</td>
                  <td>
                    <div class="d-flex justify-content-center gap-3">
                      <a href="#">View</a>
                      <span> | </span>
                      <a href="#">Edit</a>
                      <span> | </span>
                      <a href="#">To Platform</a>
                    </div>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
            <!-- Recently Added table END -->
          </div>
        </div>
        <!-- Card body 1st row END -->
        
        <!-- Card body 2nd row START -->
        <div class="row">
          <div class="d-flex justify-content-around gap-3 p-2">
            <div class="col-lg-12">
              <h3>Completed</h3>
              <table
                  class="table table-hover table-bordered table-striped table-fixed"
              >
                <thead>
                <tr>
                  <th></th>
                  <th scope="col">Title</th>
                  <th scope="col">Added</th>
                  <th class="col-lg-2" scope="col">Actions</th>
                  <th scope="col">Completed</th>
                  <th class="col-lg-5" scope="col">Notes</th>
                </tr>
                </thead>
                <tbody>
                <!-- TODO: List user's platform media -->
                <tr>
                  <th scope="row">1</th>
                  <td>That Time I Got Reincarnated as a Slime</td>
                  <td>2023-04-27</td>
                  <td>
                    <div class="d-flex justify-content-center gap-3">
                      <a href="#">View</a>
                      <span> | </span>
                      <a href="#">Edit</a>
                      <span> | </span>
                      <a href="#">To Platform</a>
                    </div>
                  </td>
                  <td>2023-04-27</td>
                  <td>
                    Lorem, ipsum dolor sit amet consectetur adipisicing
                    elit. Fugit sit totam tenetur, laudantium eius, fuga
                    quae reprehenderit illo minus, recusandae eum minima
                    error! Corrupti, perspiciatis sequi? Dolorum
                    quibusdam in amet.
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
        <!-- Card body 2nd row END -->
      </div>
      <!-- Dashboard body END -->
    </div>
  </div>
  <!-- Dashboard card END -->
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous"></script>
</body>
</html>
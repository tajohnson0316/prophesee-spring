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
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <script type="text/javascript" src="/js/app.js"></script>
  
  <title>PropheSee - Dashboard</title>
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
            <c:forEach var="platform" items="${watchlist.platforms}">
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

<!-- Main START -->
<main class="container-fluid d-flex justify-content-between gap-5 p-4">
  <!-- Quick Add card START -->
  <div class="card col-lg-2 h-50 sticky-top z-0">
    <div class="card-header text-center">
      <h2>${username}'s Watchlist</h2>
    </div>
    <%-- TODO: Refactor Quick Add form for JSP --%>
    <div class="card-body pt-1">
      <div class="text-center">
        <hr>
        <p class="text-light-emphasis bg-success fs-5 mb-2 mt-0 shadow-lg border border-2 border-black">
          Quick Add
        </p>
        <hr>
      </div>
      <div class="mb-3">
        <form:form action="watchlist/quick-add/new" method="post" modelAttribute="media">
        <form:label path="title" class="form-label">
          Media Name: *
        </form:label>
        <form:input path="title" class="form-control"/>
        <p class="text-danger">
          <form:errors path="title"/>
        </p>
      </div>
      <div class="mb-3">
        <form:select
            path="category"
            class="form-select"
        >
          <form:option value="" selected="true">Category *</form:option>
          <form:option value="Series">Series</form:option>
          <form:option value="Movie/Documentary">Movie/Documentary</form:option>
          <form:option value="Miscellaneous">Miscellaneous</form:option>
        </form:select>
        <p class="text-danger">
          <form:errors path="category"/>
        </p>
      </div>
      <div class="mb-3">
        <form:select
            path="platform"
            class="form-select"
        >
          <form:option value="" selected="true">
            Platform *
          </form:option>
          <c:forEach var="platform" items="${watchlist.platforms}">
            <form:option value="${platform.id}">
              ${platform.name}
            </form:option>
          </c:forEach>
        </form:select>
        <p class="text-danger">
          <form:errors path="platform"/>
        </p>
      </div>
    </div>
    <div class="card-footer">
      <p class="d-flex justify-content-end">* Denotes required field</p>
      <div class="d-flex justify-content-between align-items-end">
        <a href="/dashboard" id="view_all_link">View all media</a>
        <button type="submit" class="btn btn-success">
          Add Media
        </button>
      </div>
    </div>
    </form:form>
  </div>
  <!-- Quick Add card END -->
  
  <div>
    <div class="d-flex justify-content-between">
      <div>
        <h1>
          <!-- TODO: Current tab name instead of "Hulu" -->
          <!-- TODO: Current tab href here -->
          <a class="text-decoration-none" href="/dashboard">
            Hulu
          </a>
          - Sneak Peek
        </h1>
      </div>
      <div>
        <!--TODO: Add media to platform button href here -->
        <!--TODO: Add media to "Platform Name" button href here -->
        <a
            href="/watchlist/media/add"
            class="btn btn-outline-success text-wrap"
            role="button"
            id="add_to_platform_button"
        >
          Add new media to Hulu
        </a
        >
      </div>
    </div>
    <!-- Dashboard card START -->
    <div class="card">
      <div class="card-body">
        <ul class="nav nav-tabs" id="platformTabs" role="tablist">
          <!-- TODO: List user's platforms -->
          <!-- TODO: Dashboard card tabs content goes here -->
          <li class="nav-item" role="presentation">
            <%-- TODO: SET ID TO PLATFORM ID --%>
            <button
                class="nav-link"
                id="home-tab"
                data-bs-toggle="tab"
                data-bs-target="#home-tab-pane"
                role="tab"
                onclick="changeButtonText(this)"
            >
              Home
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
                class="nav-link active"
                id="hulu-tab"
                data-bs-toggle="tab"
                data-bs-target="#hulu-tab-pane"
                role="tab"
            >
              Hulu
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
                class="nav-link"
                id="netflix-tab"
                data-bs-toggle="tab"
                data-bs-target="#netflix-tab-pane"
                role="tab"
            >
              Netflix
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
                class="nav-link"
                id="disney-tab"
                data-bs-toggle="tab"
                data-bs-target="#disney-tab-pane"
                role="tab"
            >
              Disney+
            </button>
          </li>
          <li class="nav-item" role="presentation">
            <button
                class="nav-link"
                id="unlisted-tab"
                data-bs-toggle="tab"
                data-bs-target="#unlisted-tab-pane"
                role="tab"
            >
              Unlisted
            </button>
          </li>
          
          <%-- Add New Platform Tab-button START --%>
          <li class="nav-item">
            <button
                type="button"
                class="btn btn-link text-decoration-none text-success-emphasis pt-2"
                data-bs-toggle="modal"
                data-bs-target="#platformFormModal"
            >
              <i class="bi bi-plus-circle fs-5"></i>
            </button>
            
            <div class="modal fade" id="platformFormModal" tabindex="-1">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                  <div class="modal-header">
                    <h1 class="modal-title fs-5">Add New Platform</h1>
                    <button class="btn-close" type="button" data-bs-dismiss="modal"></button>
                  </div>
                  <%-- TODO: PLATFORM FORM MODAL ACTION ROUTE --%>
                  <form:form
                      action="/watchlist/platforms/modal/new"
                      method="post"
                      modelAttribute="platform"
                  >
                    <form:input type="hidden" path="watchlist" value="${watchlist.id}"/>
                    <div class="modal-body">
                      <div class="mb-3">
                          <%-- TODO: FORM VALIDATIONS FOR MODAL --%>
                        <form:label path="name" class="form-label">
                          Platform name: *
                        </form:label>
                        <form:input type="text" class="form-control" path="name" minlength="1"/>
                        <p class="text-danger">
                          <form:errors path="name"/>
                        </p>
                      </div>
                      <div class="mb-3">
                        <form:label path="siteUrl" class="form-label">
                          Link to Homepage:
                        </form:label>
                        <form:input class="form-control" path="siteUrl"/>
                        <p class="text-danger">
                          <form:errors path="siteUrl"/>
                        </p>
                      </div>
                    </div>
                    <div class="d-flex justify-content-end mx-3">
                      <p>
                        * Denotes required field
                      </p>
                    </div>
                    <div class="modal-footer">
                      <div class="d-flex justify-content-end gap-3">
                        <button type="submit" class="btn btn-success">
                          Add platform
                        </button>
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                      </div>
                    </div>
                  </form:form>
                </div>
              </div>
            </div>
          </li>
          <%-- Add New Platform Tab-button START --%>
        
        </ul>
        <%-- Tab-content START --%>
        <div class="tab-content" id="platformTabContent">
          <div
              class="tab-pane fade show active"
              id="home-tab-pane"
              role="tabpanel"
              tabindex="0"
          >
            <!-- Tab-content body START -->
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
            <!-- Tab-content body END -->
            <!-- Dashboard card END -->
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- Dashboard header END -->
</main>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
        crossorigin="anonymous">
</script>
<script type="text/javascript"
        src="${pageContext.request.contextPath}/js/addMediaToPlatformButtonScript.js">

</script>

</body>
</html>
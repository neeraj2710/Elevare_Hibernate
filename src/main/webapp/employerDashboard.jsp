<%@ page import="in.hiresense.pojo.JobPojo" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: neera
  Date: 9/16/2025
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>EmployerDashboard | <%=application.getAttribute("appName")%>
    </title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body>
<%@include file="includes/header.jsp" %>
<%
    if (session == null || session.getAttribute("userId") == null || !session.getAttribute("userRole").equals("employer")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<main class="container job-container main-content">
    <!-- Enhanced welcome section with subtitle and stats -->
    <div class="text-center mb-5">
        <h1 class="welcome-title">
            <i class="fas fa-user-tie me-3"></i>
            Welcome Back, <%=session.getAttribute("userName")%>!
        </h1>
        <p class="welcome-subtitle">
            Manage your job postings and find the perfect candidates
        </p>
    </div>

    <!-- Post-job form starts -->
    <div class="job-form-card">
        <!-- Fixed the section title class name -->
        <h2 class="job-section-title">
            <i class="fas fa-bullhorn"></i>
            Post a New Job Opening
        </h2>

        <form action="PostJobServlet" method="post">
            <!-- Enhanced form fields with better spacing and modern styling -->
            <div class="row">
                <div class="col-md-6 mb-4">
                    <label class="form-label">Job Title</label>
                    <input type="text" class="form-control" placeholder="e.g. Senior Software Engineer" name="title"
                           required>
                </div>
                <div class="col-md-6 mb-4">
                    <label class="form-label">Company Name</label>
                    <input type="text" name="company" class="form-control" placeholder="e.g. Tech Solutions Inc."
                           required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Job Description</label>
                <textarea name="description" class="form-control"
                          placeholder="Describe the role, responsibilities, and what makes this opportunity exciting..."
                          required></textarea>
            </div>

            <div class="mb-4">
                <label class="form-label">Required Skills</label>
                <input type="text" name="skills" class="form-control" placeholder="e.g. React, Node.js, MongoDB, AWS"
                       required>
            </div>

            <div class="row">
                <div class="col-md-4 mb-4">
                    <label class="form-label">Location</label>
                    <select name="location" class="form-select">
                        <option value="" disabled selected>Choose Location</option>
                        <option value="bangalore">🏙️ Bangalore</option>
                        <option value="mumbai">🌆 Mumbai</option>
                        <option value="pune">🏢 Pune</option>
                        <option value="delhi">🏛️ Delhi</option>
                        <option value="chennai">🌴 Chennai</option>
                        <option value="hyderabad">💎 Hyderabad</option>
                        <option value="kolkata">🎭 Kolkata</option>
                        <option value="remote">🌐 Remote</option>
                    </select>
                </div>
                <div class="col-md-4 mb-4">
                    <label class="form-label">Experience Level</label>
                    <select name="experience" class="form-select">
                        <option value="" disabled selected>Select Experience</option>
                        <option value="fresher">🌱 Fresher (0-1 years)</option>
                        <option value="1-3 years">📈 Junior (1-3 years)</option>
                        <option value="3-5 years">🚀 Mid-level (3-5 years)</option>
                        <option value="5+ years">⭐ Senior (5+ years)</option>
                    </select>
                </div>
                <div class="col-md-4 mb-4">
                    <label class="form-label">Package (LPA)</label>
                    <select name="packageLpa" class="form-select">
                        <option value="" disabled selected>Salary Range</option>
                        <option value="1-3 lpa">💰 1-3 LPA</option>
                        <option value="3-5 lpa">💎 3-5 LPA</option>
                        <option value="5-7 lpa">🏆 5-7 LPA</option>
                        <option value="7-10 lpa">🌟 7-10 LPA</option>
                        <option value="10+ lpa">👑 10+ LPA</option>
                    </select>
                </div>
            </div>

            <div class="row">
                <div class="col-md-6 mb-4">
                    <label class="form-label">Number of Vacancies</label>
                    <input type="number" name="vacancies" class="form-control" placeholder="How many positions?" min="1"
                           required>
                </div>
                <div class="col-md-6 mb-4 d-flex align-items-end">
                    <button type="submit" class="btn btn-login w-100">
                        <i class="fas fa-rocket me-2"></i>Post Job Opening
                    </button>
                </div>
            </div>
        </form>
    </div>

    <!-- Search and filter starts -->
    <div class="search-filter-card ">
        <!-- Fixed the section title class name -->
        <h2 class="job-section-title">
            <i class="fas fa-search"></i>
            Manage Your Job Postings
        </h2>

        <form action="EmployerDashboardServlet" method="post">
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Search Jobs</label>
                    <input type="text" name="search" value="${param.search}" class="form-control"
                           placeholder="Search by job title or company">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Status Filter</label>
                    <select name="status" class="form-select">
                        <option value="" selected>All Status</option>
                        <option value="active" ${param.status == 'active' ? 'selected' : ''}>✅ Active</option>
                        <option value="inactive" ${param.status == 'inactive' ? 'selected' : ''}>⏸️ Inactive</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Sort By</label>
                    <select name="sort" class="form-select">
                        <option value="" selected>Sort Options</option>
                        <option value="asc" ${param.sort == 'asc' ? 'selected' : ''}>📈 Least Applications</option>
                        <option value="desc" ${param.sort == 'desc' ? 'selected' : ''}>📊 Most Applications</option>

                    </select>
                </div>
                <div class="col-md-2 d-flex align-items-end">
                    <button type="submit" class="btn btn-secondary w-100">
                        <i class="fas fa-filter me-1"></i>Filter
                    </button>
                </div>
            </div>
        </form>
    </div>

    <%
        List<JobPojo> jobList = (List<JobPojo>) request.getAttribute("jobList");
        if (jobList != null && !jobList.isEmpty()) {
    %>

    <!-- manage job listing table -->
    <div class="admin-card p-4 mb-4">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h3 class="text-white mb-0">
                <i class="fas fa-briefcase me-2"></i><%=jobList.get(0).getCompany()%>'s Posted Jobs
            </h3>
            <span class="badge bg-primary fs-6 px-3 py-2">
                <i class="fas fa-list me-2"></i><%=jobList != null ? jobList.size() : 0%> Jobs
            </span>
        </div>

        <div class="table-responsive">
            <table class="table table-hover admin-table align-middle">
                <thead>
                <tr>
                    <th class="text-white" style="width: 40%;">
                        <i class="fas fa-suitcase me-2"></i>Job Title
                    </th>
                    <th class="text-white text-center" style="width: 15%;">
                        <i class="fas fa-users me-2"></i>Applicants
                    </th>
                    <th class="text-white text-center" style="width: 15%;">
                        <i class="fas fa-info-circle me-2"></i>Status
                    </th>
                    <th class="text-white text-center" style="width: 30%;">
                        <i class="fas fa-cog me-2"></i>Actions
                    </th>
                </tr>
                </thead>
                <tbody>
                <%

                        for (int i = 0; i < jobList.size(); i++) {
                            JobPojo job = jobList.get(i);
                            String rowClass = (i % 2 == 0) ? "job-row" : "job-row bg-dark";
                %>
                <tr class="<%=rowClass%>">
                    <td class="fw-semibold">
                        <i class="fas fa-bookmark me-2 text-primary"></i>
                        <%=job.getTitle()%>
                    </td>
                    <td class="text-center">
                        <span class="badge text-dark fw-semibold fs-6 px-3 py-2">
                            <i class="fas fa-user-friends me-1 text-info"></i>
                            <%=job.getApplicantCount()%>
                        </span>
                    </td>
                    <td class="text-center">
                        <%
                            if (job.getStatus().equals("active")) {
                        %>
                        <span class="badge text-dark fw-semibold fs-6 px-3 py-2">
                            <i class="fas fa-check-circle me-1 text-success"></i>Active
                        </span>
                        <%
                        } else {
                        %>
                        <span class="badge text-dark fw-semibold fs-6 px-3 py-2">
                            <i class="fas fa-pause-circle me-1 text-danger"></i>Inactive
                        </span>
                        <%
                            }
                        %>
                    </td>
                    <td class="text-center">
                        <div class="btn-group" role="group">
                            <a href="ViewApplicantsServlet?jobId=<%=job.getId()%>"
                               class="btn btn-sm btn-primary"
                               title="View Applicants">
                                <i class="fas fa-eye me-1"></i>View
                            </a>

                            <a href="ToggleJobStatusServlet?jobId=<%=job.getId()%>"
                               class="btn btn-sm <%=job.getStatus().equals("active")?"btn-danger":"btn-success"%>"
                               title="Deactivate Job">
                                <i class="fas fa-times-circle me-1"></i><%=job.getStatus().equals("active")?"Deactivate":"Activate"%>
                            </a>

                        </div>
                    </td>
                </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <%
    } else {
    %>

        <div colspan="4" class="text-center text-white py-5">
            <i class="fas fa-inbox fa-3x mb-3 text-muted"></i>
            <p class="fs-5 mb-0">No job listings found</p>
            <p class="text-white">Post your first job to see it here</p>
        </div>

    <%
        }
    %>
    <!-- manage job listing table ends -->
</main>

<%
    String success = request.getParameter("success");
    if("1".equals(success)){
%>
<script>
    Swal.fire({
        title: "Job Posted!",
        text: "Your job has been successfully posted!",
        timer: 2000,
        icon: "success",
        showConfirmButton: false
    });
</script>
<%
    }
    String error = request.getParameter("error");
    if("1".equals(error)){
%>
<script>
    Swal.fire({
        title: "Failed!",
        text: "Something went wrong! Please try again",
        icon: "error",
        confirmButtonText: "Okay"
    });
</script>
<%
    }
%>

<%@include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page
        import="in.hiresense.pojo.ApplicationPojo, in.hiresense.pojo.JobPojo"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applicants | <%=application.getAttribute("appName")%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
            rel="stylesheet">
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
            rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body class="user-dashboard-page">
<%
    if(session.getAttribute("userId") == null || !session.getAttribute("userRole").equals("employer")){
        response.sendRedirect("login.jsp");
        return;
    }
    JobPojo job = (JobPojo)request.getAttribute("job");
%>
<%@ include file="includes/header.jsp"%>

<main class="container py-5">
    <h2 class="welcome-title mb-4"><i class="fas fa-eye me-2"></i>View Applicants</h2>

    <div class="glass-card p-4 mb-4">
        <h4 class="job-section-title text-white"><i class="fas fa-briefcase me-2 text-white"></i><%=job.getTitle()%> @ <%=job.getCompany()%></h4>
        <p class="text-white">
            <i class="bi bi-geo-alt me-2 text-white"></i>
            <%=job.getLocation()%>
            &nbsp; <i class="bi bi-briefcase me-2 text-white"></i>
            <%=job.getExperience()%>
            &nbsp; <i class="bi bi-currency-rupee me-2 text-white"></i>
            <%=job.getPackageLpa()%>
            &nbsp; <i class="bi bi-people me-2 text-white"></i>
            <%=job.getVacancies()%>
        </p>
    </div>

    <div class="filter-card glass-card p-4 mb-4">
        <h4 class="filter-title mb-3"><i class="fas fa-filter me-2"></i>Filter Applicants</h4>
        <form method="get" action="ViewApplicantsServlet">
            <input type="hidden" name="jobId" />
            <div class="row align-items-center">
                <div class="col-md-4">
                    <label for="status" class="form-label text-white">Filter by Status</label>
                    <select
                            name="status" class="form-select user-select" onchange="this.form.submit">
                        <option value="applied" <%="applied".equals(request.getAttribute("selectedStatus"))?"selected":""%>>
                            Applied
                        <option value="shortlisted" <%="shortlisted".equals(request.getAttribute("selectedStatus"))?"selected":""%>>
                            Shortlisted </option>
                        <option value="rejected" <%="rejected".equals(request.getAttribute("selectedStatus"))?"selected":""%>>
                            Rejected</option>
                    </select>
                </div>
            </div>
        </form>
    </div>

    <h4 class="section-title mb-3"><i class="fas fa-users me-2"></i>Applicants List</h4>
    <div class="row g-4">
        <%
            List<ApplicationPojo> applicants= (List<ApplicationPojo>)request.getAttribute("applicants");
            if(applicants!=null && !applicants.isEmpty()){
                for(ApplicationPojo a : applicants){

        %>
        <div class="col-md-6 col-lg-4">
            <div class="job-card glass-card p-3 position-relative">
                <h6 class="fw-bold text-white">
                    <i class="fas fa-user me-2"></i>User ID: <%=a.getUserId()%></h6>
                <p class="mb-1 text-white">
                    <i class="bi bi-bar-chart me-1"></i> <strong>Status:</strong> <span
                        class="text-capitalize"><%=a.getStatus()%></span>
                </p>
                <p class="mb-1 text-white">
                    <i class="bi bi-calendar-check me-1"></i> <strong>Applied: </strong>
                    <%=a.getAppliedAt()%>
                </p>
                <p class="mb-2 text-white">
                    <i class="bi bi-file-earmark-arrow-down me-1"></i> <strong>Resume:</strong>
                </p>
                <%
                    if(a.getResume_path()!=null && !a.getResume_path().isEmpty()){
                %>
                <a href="DownloadResumeServlet?path=<%=URLEncoder.encode(a.getResume_path(), "UTF-8")%>"
                   target="_blank" class="btn btn-primary btn-sm w-100 mb-2">
                    <i class="bi bi-download me-1"></i> Download Resume
                </a>
                <%
                }else{
                %>
                <span class="badge bg-danger mb-2">No Resume</span>
                <%
                    }
                %>

                <form method="post" action="UpdateApplicationStatusServlet"
                      class="d-flex gap-2 mt-3">
                    <input type="hidden" name="appId" value="<%=a.getId()%>" /> <input
                        type="hidden" name="jobId" value="<%=a.getJobId()%>" />
                    <button type="submit" name="status" value="shortlisted"
                            class="btn btn-success btn-sm">Shortlist</button>
                    <button type="submit" name="status" value="rejected"
                            class="btn btn-danger btn-sm">Reject</button>
                </form>
                <form action="" method="get">
                    <input type="hidden" name="userId" value="<%=a.getUserId()%>">
                    <button type="submit"
                            class="btn btn-gradient btn-sm mt-2">
                        <i class="bi bi-eye me-1"></i> View Full Details
                    </button>
                </form>
                <div class="position-absolute badge bg-primary bottom-0 end-0 p-2 small m-2">

                    <strong>Match: <%=a.getScore()%>%</strong>
                </div>
            </div>
        </div>
        <%
            }
        }else{
        %>
        <div class="col-12">
            <div class="alert alert-warning text-center glass-card">
                <i class="fas fa-exclamation-triangle me-2"></i>No applicants found for this status.
            </div>
        </div>
        <%
            }
        %>
    </div>
</main>

<%@ include file="includes/footer.jsp"%>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

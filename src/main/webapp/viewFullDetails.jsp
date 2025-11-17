<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Applicant Details | <%=application.getAttribute("appName")%></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body class="user-dashboard-page">
<%
    if(session.getAttribute("userId") == null || !session.getAttribute("userRole").equals("employer")){
        response.sendRedirect("login.jsp");
        return;
    }

    // Backend se ye data pass hoga
    String applicantName = (String) request.getAttribute("applicantName");
    String personalDetails = (String) request.getAttribute("personalDetails");
    String resumeSummary = (String) request.getAttribute("summary");
    String education = (String) request.getAttribute("education");
    String workExperience = (String) request.getAttribute("workEx");
    List<String> skills = (List<String>) request.getAttribute("skills");
%>
<%@ include file="includes/header.jsp"%>

<main class="container py-5">
    <!-- Applicant Name as Heading -->
    <h2 class="welcome-title mb-4">
        <i class="fas fa-user-circle me-2"></i><%= applicantName != null ? applicantName : "Applicant Details" %>
    </h2>

    <!-- Personal Details Card -->
    <div class="glass-card p-4 mb-4">
        <h4 class="job-section-title text-white">
            <i class="fas fa-id-card me-2 text-white"></i>Personal Details
        </h4>
        <p class="text-white">
            <%= personalDetails != null ? personalDetails : "No personal details available" %>
        </p>
    </div>

    <!-- Resume Summary Card -->
    <div class="glass-card p-4 mb-4">
        <h4 class="job-section-title text-white">
            <i class="fas fa-file-alt me-2 text-white"></i>Resume Summary
        </h4>
        <p class="text-white">
            <%= resumeSummary != null ? resumeSummary : "No summary available" %>
        </p>
    </div>

    <!-- Education Details Card -->
    <div class="glass-card p-4 mb-4">
        <h4 class="job-section-title text-white">
            <i class="fas fa-graduation-cap me-2 text-white"></i>Education
        </h4>
        <p class="text-white">
            <%= education != null ? education : "No education details available" %>
        </p>
    </div>

    <!-- Work Experience Card -->
    <div class="glass-card p-4 mb-4">
        <h4 class="job-section-title text-white">
            <i class="fas fa-briefcase me-2 text-white"></i>Work Experience
        </h4>
        <p class="text-white">
            <%= workExperience != null ? workExperience : "No work experience available" %>
        </p>
    </div>

    <!-- Skills Card -->
    <div class="glass-card p-4 mb-4">
        <h4 class="job-section-title text-white">
            <i class="fas fa-tools me-2 text-white"></i>Skills
        </h4>
        <%
            if(skills != null && !skills.isEmpty()) {

        %>
        <ul class="list-unstyled">
            <% for(String skill : skills) { %>
            <li class="text-white mb-2">
                <i class="bi bi-check-circle-fill me-2 text-success"></i><%= skill.trim() %>
            </li>
            <% } %>
        </ul>
        <%
            } else {
        %>
        <p class="text-white">No skills available</p>
        <%
            }
        %>
    </div>

    <!-- Back Button -->
    <div class="text-center mt-4">
        <a href="ViewApplicantsServlet?jobId=<%=request.getAttribute("jobId")%>" class="btn btn-gradient">
            <i class="bi bi-arrow-left me-2"></i>Back to Applicants
        </a>
    </div>
</main>

<%@ include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

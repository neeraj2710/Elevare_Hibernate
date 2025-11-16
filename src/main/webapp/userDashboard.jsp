<%@ page import="in.hiresense.pojo.JobPojo" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: neera
  Date: 9/16/2025
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HireSense-UserDashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body class="user-dashboard-page">
<%@include file="includes/header.jsp" %>
<%
    if (session == null || session.getAttribute("userId") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<main class="container py-5">
    <h2 class="welcome-title floating-animation mb-4"><i
            class="fas fa-user-circle me-2"></i>Welcome, <%= session.getAttribute("userName")%>
    </h2>

    <!-- filter code starts -->
    <div class="filter-card glass-card mb-4">
        <h4 class="filter-title mb-3"><i class="fas fa-filter me-2"></i>Job Filters</h4>
        <form action="UserDashboardServlet">
            <div class="row g-3">
                <div class="col-md-3">
                    <input
                            type="text"
                            name="search"
                            class="form-control user-input"
                            placeholder="Search by title or company"
                            value="${param.search}"
                    />
                </div>

                <div class="col-md-2">
                    <input
                            type="text"
                            name="location"
                            class="form-control user-input"
                            placeholder="Location"
                            value="${param.location}"
                    />
                </div>

                <div class="col-md-2">
                    <select name="experience" class="form-select user-select">
                        <option value="" selected disabled>Experience</option>
                        <option value="fresher" ${param.experience == 'fresher' ? 'selected':''}>Fresher</option>
                        <option value="0-1 years" ${param.experience == '0-1' ? 'selected':''}>0-1 years</option>
                        <option value="1-2 years" ${param.experience == '1-2' ? 'selected':''}>1-2 years</option>
                        <option value="2-3 years" ${param.experience == '2-3' ? 'selected':''}>2-3 years</option>
                        <option value="3-5 years" ${param.experience == '3-5' ? 'selected':''}>3-5 years</option>
                        <option value="5+ years" ${param.experience == '5+' ? 'selected':''}>5+ years</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <select name="packageLpa" class="form-select user-select">
                        <option value="" selected disabled>Package (LPA)</option>
                        <option value="1-3 lpa" ${param.packageLpa == '1-3 lpa' ? 'selected':''}>1-3 LPA</option>
                        <option value="3-5 lpa" ${param.packageLpa == '3-5 lpa' ? 'selected':''}>3-5 LPA</option>
                        <option value="5-7 lpa" ${param.packageLpa == '5-7 lpa' ? 'selected':''}>5-7 LPA</option>
                        <option value="7-10 lpa" ${param.packageLpa == '7-10 lpa' ? 'selected':''}>7-10 LPA</option>
                        <option value="10+ lpa" ${param.packageLpa == '10+ lpa' ? 'selected':''}>10+ LPA</option>
                        <option value="not disclosed">Not disclosed</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <select name="sort" class="form-select user-select">
                        <option value="" selected disabled>Sort</option>
                        <option value="asc" ${param.sort == 'asc' ? 'selected':''}>Fewest</option>
                        <option value="desc" ${param.sort == 'desc' ? 'selected':''}>Most</option>
                    </select>
                </div>

                <div class="col-md-1">
                    <button type="submit" class="btn btn-gradient">Go</button>
                </div>
            </div>
        </form>
    </div>
    <!-- filter code ends -->

    <!-- job cards section starts -->
    <%
        List<JobPojo> jobs = (List<JobPojo>) request.getAttribute("jobs");
        Set<Integer> appliedJobIds = (Set<Integer>) request.getAttribute("appliedJobIds");
        boolean resumeUploaded = (boolean) request.getAttribute("resumeUploaded");
        if (jobs != null && !jobs.isEmpty()) {
    %>
    <div class="jobs-section">
        <h4 class="section-title mb-4"><i class="fas fa-briefcase me-2"></i>Available Jobs</h4>
        <div class="row">
            <%
                for (JobPojo job : jobs) {
            %>
            <div class="col-md-4">
                <div class="job-card glass-card p-3 position-relative">
          <span class="position-absolute top-0 end-0 px-2 py-1 small"
          >
              <%=job.getCreatedAt() != null ? new SimpleDateFormat("d MMM").format(job.getCreatedAt()) : ""%>
          </span>

                    <div class="card-body">
                        <h5 class="mb-1"><%=job.getTitle()%>
                        </h5>
                        <p class="text-muted"><%=job.getCompany()%>
                        </p>

                        <div class="d-flex flex-wrap text-muted small mb-2 gap-3">
                            <div><i class="bi bi-briefcase-fill me-1"></i><%=job.getExperience()%>
                            </div>
                            <div><i class="bi bi-currency-rupee me-1"></i><%=job.getPackageLpa()%>
                            </div>
                            <div><i class="bi bi-geo-alt me-1"></i><%=job.getLocation()%>
                            </div>
                            <div><i class="bi bi-people-fill me-1"></i><%=job.getVacancies()%> Openings</div>
                        </div>

                        <%
                            if (appliedJobIds.contains(job.getId())) {
                        %>
                        <span class="badge bg-success col-md-2 p-2 mt-2">Applied</span>
                        <br/>
                        <%
                        } else {
                        %>

                        <button
                                type="button"
                                class="btn btn-gradient btn-sm mt-2 small"

                                onclick="openResumePopup(<%=job.getId()%>, <%=job.getScore()%>, '<%=job.getSkills().replace("'", "\\'")%>')"

                        >
                            Apply Now
                        </button>
                        <button
                                type="button"
                                class="btn btn-outline-light btn-sm mt-2 small"

                                onclick='showDetails(<%=job.getId()%>,"<%=job.getTitle().replace("\"", "&quot;")%>", " <%=job.getCompany().replace("\"", "&quot;")%>", "<%=job.getLocation().replace("\"", "&quot;")%>", "<%=job.getExperience().replace("\"", "&quot;")%>", "<%=job.getPackageLpa().replace("\"", "&quot;")%>", "<%=job.getVacancies()%>", "<%=job.getSkills().replace("\"", "&quot;")%>", "<%=job.getDescription().replace("\"", "&quot;")%>", "<%=new java.text.SimpleDateFormat("dd MMM yyyy").format(job.getCreatedAt())%>")'
                        >
                            View Details
                        </button>
                        <%
                            }
                        %>
                    </div>
                    <%
                        if (resumeUploaded) {
                    %>
                    <div
                            class="position-absolute badge bg-primary bottom-0 end-0 p-2 small m-2"
                    >
                        <%=job.getScore()%>% Match
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
            <%
                }
            %>
        </div>
    </div>
    <%

    } else {
    %>
    <p class="text-danger text-center"> No Jobs Found</p>
    <%
        }
    %>
    <!-- job cards section ends -->

    <!-- Resume Upload Modal -->
    <div class="modal fade" id="resumeModal" tabindex="-1"
         aria-labelledby="resumeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <form id="resumeForm" method="post" enctype="multipart/form-data"
                  action="UploadResumeServlet"
                  class="modal-content bg-dark text-white">
                <div class="modal-header">
                    <h5 class="modal-title" id="resumeModalLabel">📄 Upload Resume</h5>
                    <button type="button" class="btn-close btn-close-white"
                            data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" name="jobId" id="modalJobId"> <input
                        type="hidden" name="skills" id="modalSkills"> <label
                        for="resumeFile" class="form-label">Upload Resume (PDF)</label> <input
                        type="file" name="resume" id="resumeFile" class="form-control"
                        accept=".pdf" required/>
                </div>
                <div class="modal-footer justify-content-between">
                    <button type="submit" class="btn btn-success">Continue</button>
                    <button type="button" class="btn btn-secondary"
                            data-bs-dismiss="modal">Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!-- resume upload popup ends -->

    <!-- view job details popup starts -->
    <div class="modal fade" id="jobDetailsModal" tabindex="-1"
         aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content bg-white text-dark">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold" id="modalJobTitle">Job Title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>
                        <strong>Company:</strong> <span id="modalCompany"></span>
                    </p>
                    <p>
                        <strong>Location:</strong> <span id="modalLocation"></span>
                    </p>
                    <p>
                        <strong>Experience:</strong> <span id="modalExperience"></span>
                    </p>
                    <p>
                        <strong>Package:</strong> <span id="modalPackage"></span>
                    </p>
                    <p>
                        <strong>Vacancies:</strong> <span id="modalVacancies"></span>
                    </p>
                    <p>
                        <strong>Skills:</strong> <span id="modalSkills"></span>
                    </p>
                    <p>
                        <strong>Description:</strong> <span id="modalDescription"></span>
                    </p>
                    <p>
                        <strong>Posted On:</strong> <span id="modalPostedDate"></span>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <!-- view job details popup ends -->
</main>

<%@include file="includes/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous"></script>
<script>
<%
    if (request.getParameter("applied") != null) {

%>

    Swal.fire({icon: 'success', title: 'Applied Successfully', showConfirmButton: false, timer: 1500})
    <%
        }
    %>
    let lastFocusedElement = null;
    function openResumePopup(jobId, score, skills) {
        const resumeUploaded =<%=request.getAttribute("resumeUploaded")%>;
        lastFocusedElement = document.activeElement;
        if (resumeUploaded) {
            Swal.fire({
                title: "Apply for this job?", icon:
                    "question", showCancelButton: true, confirmButtonText: "Yes, Apply",
                cancelButtonText: "Cancel"
            })
                .then((result) => {
                    if (result.isConfirmed) {
                        const form = document.createElement("form");
                        form.method = "POST";
                        form.action = "ApplyJobServlet";
                        const input1 = document.createElement("input");
                        input1.type = "hidden";
                        input1.name = "jobId";
                        input1.value = jobId;
                        form.appendChild(input1);
                        const input2 = document.createElement("input");
                        input2.type = "hidden";
                        input2.name = "score";
                        input2.value = score;
                        form.appendChild(input2);
                        document.body.appendChild(form);
                        form.submit();
                    }
                });
        } else {
            document.getElementById("modalJobId").value = jobId;
            document.getElementById("modalSkills").value = skills;
            document.getElementById("resumeFile").value = "";
            new
            bootstrap.Modal(document.getElementById('resumeModal')).show();
        }
    }

    function showDetails(id, title, company, location, experience, packageLpa, vacancies, skills, description, posted) {
        lastFocusedElement = document.activeElement;
        document.getElementById("modalJobTitle").innerText = title;
        document.getElementById("modalCompany").innerText = company;
        document.getElementById("modalLocation").innerText = location;
        document.getElementById("modalExperience").innerText = experience;
        document.getElementById("modalPackage").innerText = packageLpa;
        document.getElementById("modalVacancies").innerText = vacancies;
        document.getElementById("modalSkills").innerText = skills;
        document.getElementById("modalDescription").innerText = description;
        document.getElementById("modalPostedDate").innerText = posted;
        const jobModalEl = document.getElementById('jobDetailsModal');
        const jobModal = new bootstrap.Modal(jobModalEl);
        new bootstrap.Modal(document.getElementById('jobDetailsModal')).show();
    }

// On modal hidden, restore focus to opener if possible
document.getElementById('jobDetailsModal').addEventListener('hidden.bs.modal', function () {
    if (lastFocusedElement && document.contains(lastFocusedElement)) {
        try {
            lastFocusedElement.focus({preventScroll: true});
        } catch (e) {
            lastFocusedElement.focus();
        }
    } else {
        // fallback: focus first focusable element or body
        const firstFocusable = document.querySelector('button, a, input, [tabindex]:not([tabindex="-1"])');
        if (firstFocusable) firstFocusable.focus();
        else document.body.focus();
    }
    lastFocusedElement = null;
});

// similar restore for resumeModal if you open it programmatically
document.getElementById('resumeModal').addEventListener('hidden.bs.modal', function () {
    if (lastFocusedElement && document.contains(lastFocusedElement)) {
        try {
            lastFocusedElement.focus({preventScroll: true});
        } catch (e) {
            lastFocusedElement.focus();
        }
    }
    lastFocusedElement = null;
});

</script>
</body>
</html>

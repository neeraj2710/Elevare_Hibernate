<%--
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body class="user-dashboard-page">
<%@include file="includes/header.jsp"%>

<main class="container py-5">
    <h2 class="welcome-title floating-animation mb-4"><i class="fas fa-user-circle me-2"></i>Welcome Neeraj</h2>

    <!-- filter code starts -->
    <div class="filter-card glass-card mb-4">
        <h4 class="filter-title mb-3"><i class="fas fa-filter me-2"></i>Job Filters</h4>
        <form action="#">
            <div class="row g-3">
                <div class="col-md-3">
                    <input
                            type="text"
                            name="search"
                            class="form-control user-input"
                            placeholder="Search by title or company"
                    />
                </div>

                <div class="col-md-2">
                    <input
                            type="text"
                            name="location"
                            class="form-control user-input"
                            placeholder="Location"
                    />
                </div>

                <div class="col-md-2">
                    <select name="experience" class="form-select user-select">
                        <option value="" selected disabled>Experience</option>
                        <option value="fresher">Fresher</option>
                        <option value="0-1">0-1 years</option>
                        <option value="1-3">1-3 years</option>
                        <option value="3-5">3-5 years</option>
                        <option value="5+">5+ years</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <select name="packageLpa" class="form-select user-select">
                        <option value="" selected disabled>Package (LPA)</option>
                        <option value="1-3">1-3 LPA</option>
                        <option value="3-6">3-6 LPA</option>
                        <option value="6-10">6-10 LPA</option>
                        <option value="10+">10+ LPA</option>
                        <option value="not disclosed">Not disclosed</option>
                    </select>
                </div>

                <div class="col-md-2">
                    <select name="sort" class="form-select user-select">
                        <option value="" selected disabled>Sort</option>
                        <option value="fewest">Fewest</option>
                        <option value="most">Most</option>
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
    <div class="jobs-section">
        <h4 class="section-title mb-4"><i class="fas fa-briefcase me-2"></i>Available Jobs</h4>
        <div class="row">
            <div class="col-md-4">
                <div class="job-card glass-card p-3 position-relative">
          <span class="position-absolute top-0 end-0 px-2 py-1 small"
          >6 Sep</span
          >

                    <div class="card-body">
                        <h5 class="mb-1">Software Developer</h5>
                        <p class="text-muted">A2Infotech Pvt Ltd</p>

                        <div class="d-flex flex-wrap text-muted small mb-2 gap-3">
                            <div><i class="bi bi-briefcase-fill me-1"></i>3-5 years</div>
                            <div><i class="bi bi-currency-rupee me-1"></i>6-10 LPA</div>
                            <div><i class="bi bi-geo-alt me-1"></i>Noida, India</div>
                            <div><i class="bi bi-people-fill me-1"></i>5 Openings</div>
                        </div>

                        <span class="badge bg-success col-md-2 p-2 mt-2">Applied</span>
                        <br />
                        <button
                                type="button"
                                class="btn btn-gradient btn-sm mt-2 small"
                                data-bs-toggle="modal"
                                data-bs-target="#uploadresume"
                        >
                            Apply Now
                        </button>
                        <button
                                type="button"
                                class="btn btn-outline-light btn-sm mt-2 small"
                                data-bs-toggle="modal"
                                data-bs-target="#jobDetails"
                        >
                            View Details
                        </button>
                    </div>

                    <div
                            class="position-absolute badge bg-primary bottom-0 end-0 p-2 small m-2"
                    >
                        30% match
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- job cards section ends -->

    <!-- resume upload popup starts -->
    <div class="modal fade" id="uploadresume">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <form
                    action="#"
                    method="post"
                    class="modal-content user-modal"
            >
                <div class="modal-header">
                    <h5>Upload Resume</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <input type="hidden" name="jobId" id="modalJobId" />
                    <input type="hidden" name="skills" id="modalSkills" />
                    <label for="resumeFile" class="form-label">Upload Resume</label>
                    <input
                            type="file"
                            name="resume"
                            id="resumeFile"
                            class="form-control"
                            accept=".pdf"
                            required
                    />
                </div>

                <div class="modal-footer justify-content-between">
                    <button type="submit" class="btn btn-success">
                        Continue
                    </button>
                    <button
                            type="submit"
                            class="btn btn-secondary"
                            data-bs-dismiss="modal"
                    >
                        Cancel
                    </button>
                </div>
            </form>
        </div>
    </div>
    <!-- resume upload popup ends -->

    <!-- view job details popup starts -->
    <div class="modal fade" id="jobDetails">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <form
                    action="#"
                    method="post"
                    class="modal-content user-modal"
            >
                <div class="modal-header">
                    <h5 class="fw-bold" id="modalJobTitle">Software Developer</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <p><strong>Company: </strong><span id="modalCompany">A2Infotech Pvt Ltd</span></p>
                    <p><strong>Location: </strong><span id="modalLocation">Delhi</span></p>
                    <p><strong>Experience: </strong><span id="modalExperience">2-3 Years</span></p>
                    <p><strong>Package: </strong><span id="modalPackage">4 LPA</span></p>
                    <p><strong>Vacancies: </strong><span id="modalVacancies">10</span></p>
                    <p><strong>Skills: </strong><span id="modalSkills">Java, Python, Go, SQL, Docker, K8s</span></p>
                    <p><strong>Job Description: </strong><span id="modalDescription">Lorem ipsum dolor sit amet consectetur adipisicing elit. Officiis, mollitia?</span></p>
                    <p><strong>Date posted: </strong><span id="modalDatePosted">6 Sept 2025</span></p>
                </div>
            </form>
        </div>
    </div>
    <!-- view job details popup ends -->
</main>

<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>

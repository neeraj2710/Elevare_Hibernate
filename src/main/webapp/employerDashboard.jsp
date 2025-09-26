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
    <title>HireSense-EmployerDashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">


</head>
<body>
<%@include file="includes/header.jsp"%>

<main class="container job-container main-content">
    <!-- Enhanced welcome section with subtitle and stats -->
    <div class="text-center mb-5">
        <h1 class="welcome-title">
            <i class="fas fa-user-tie me-3"></i>
            Welcome Back, Neeraj!
        </h1>
        <p class="welcome-subtitle">
            Manage your job postings and find the perfect candidates
        </p>
    </div>

    <!-- Post job form starts -->
    <div class="job-form-card">
        <!-- Fixed section title class name -->
        <h2 class="job-section-title">
            <i class="fas fa-bullhorn"></i>
            Post a New Job Opening
        </h2>

        <form action="#" method="post">
            <!-- Enhanced form fields with better spacing and modern styling -->
            <div class="row">
                <div class="col-md-6 mb-4">
                    <label class="form-label">Job Title</label>
                    <input type="text" class="form-control" placeholder="e.g. Senior Software Engineer" name="title" required>
                </div>
                <div class="col-md-6 mb-4">
                    <label class="form-label">Company Name</label>
                    <input type="text" name="company" class="form-control" placeholder="e.g. Tech Solutions Inc." required>
                </div>
            </div>

            <div class="mb-4">
                <label class="form-label">Job Description</label>
                <textarea name="description" class="form-control" placeholder="Describe the role, responsibilities, and what makes this opportunity exciting..." required></textarea>
            </div>

            <div class="mb-4">
                <label class="form-label">Required Skills</label>
                <input type="text" name="skills" class="form-control" placeholder="e.g. React, Node.js, MongoDB, AWS" required>
            </div>

            <div class="row">
                <div class="col-md-4 mb-4">
                    <label class="form-label">Location</label>
                    <select name="location" class="form-select">
                        <option value="" disabled selected>Choose Location</option>
                        <option value="banglore">🏙️ Bangalore</option>
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
                    <input type="number" name="vacancies" class="form-control" placeholder="How many positions?" min="1" required>
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
        <!-- Fixed section title class name -->
        <h2 class="job-section-title">
            <i class="fas fa-search"></i>
            Manage Your Job Postings
        </h2>

        <form action="#" method="post">
            <div class="row g-3">
                <div class="col-md-4">
                    <label class="form-label">Search Jobs</label>
                    <input type="text" name="search" class="form-control" placeholder="Search by job title or company">
                </div>
                <div class="col-md-3">
                    <label class="form-label">Status Filter</label>
                    <select name="status" class="form-select">
                        <option value="" disabled selected>All Status</option>
                        <option value="active">✅ Active</option>
                        <option value="inactive">⏸️ Inactive</option>
                        <option value="draft">📝 Draft</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label">Sort By</label>
                    <select name="sort" class="form-select">
                        <option value="" disabled selected>Sort Options</option>
                        <option value="asc">📈 Least Applications</option>
                        <option value="desc">📊 Most Applications</option>
                        <option value="recent">🕒 Most Recent</option>
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

    <!-- manage job listing table -->
    <div class="admin-card p-4 mb-4">
        <h5 class="text-white mb-3">
            <i class="fas fa-briefcase me-2"></i> Manage Job Listing
        </h5>
        <div class="table-responsive">
            <table class="table table-hover admin-table">
                <thead>
                <tr>
                    <th class="text-white">Job title</th>
                    <th class="text-white">Company</th>
                    <th class="text-white">Applicants</th>
                    <th class="text-white">Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-white">SDE</td>
                    <td class="text-white">Google</td>
                    <td class="text-white">1098</td>
                    <td>
                        <a href="#" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash me-1"></i>Remove
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" class="text-center text-warning">
                        <i class="fas fa-exclamation-triangle me-2"></i>No Job Listings found
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- manage job listing table ends -->
</main>

<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>

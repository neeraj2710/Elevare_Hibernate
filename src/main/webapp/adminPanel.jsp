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
    <title>HireSense-AdminPanel</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<%@include file="includes/header.jsp"%>

<main class="container py-5 mt-5">
    <h2 class="mb-4 text-white">
        <i class="fas fa-crown me-2"></i>Admin Dashboard
    </h2>

    <!-- filter section starts -->
    <div class="admin-filter-card p-4 mb-4">
        <h5 class="text-white mb-3">
            <i class="fas fa-filter me-2"></i>Filter Users
        </h5>
        <form action="#" method="get">
            <div class="row g-2">
                <div class="col-md-4">
                    <input
                            type="text"
                            name="search"
                            class="form-control admin-input"
                            placeholder="Search by name or email"
                    />
                </div>
                <div class="col-md-3">
                    <select name="role" class="form-select admin-input" id="">
                        <option value="" selected>All roles</option>
                        <option value="employer">Employer</option>
                        <option value="user">User</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="status" class="form-select admin-input" id="">
                        <option value="" selected>All status</option>
                        <option value="employer">Active</option>
                        <option value="user">Blocked</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-gradient" type="submit">
                        <i class="fas fa-search me-2"></i>Apply
                    </button>
                </div>
            </div>
        </form>
    </div>
    <!-- filter section ends -->

    <!-- User table starts -->
    <div class="admin-card p-4 mb-5">
        <h5 class="text-white mb-3">
            <i class="fas fa-users me-2"></i> Users
        </h5>
        <div class="table-responsive">
            <table class="table table-hover admin-table">
                <thead>
                <tr>
                    <th class="text-white">Name</th>
                    <th class="text-white">Email</th>
                    <th class="text-white">Role</th>
                    <th class="text-white">Status</th>
                    <th class="text-white">Action</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td class="text-white">Neeraj</td>
                    <td class="text-white">neerajwadhwaney2003@gmail.com</td>
                    <td class="text-white">Employer</td>
                    <td class="text-white">Active</td>
                    <td>
                        <a href="#" class="btn btn-danger btn-sm">
                            <i class="fas fa-ban me-1"></i>Block
                        </a>
                        <a href="#" class="btn btn-success btn-sm">
                            <i class="fas fa-check me-1"></i>Unblock
                        </a>
                    </td>
                </tr>
                <tr>
                    <td colspan="5" class="text-center text-warning">
                        <i class="fas fa-exclamation-triangle me-2"></i>No Users found
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    <!-- User table ends -->

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

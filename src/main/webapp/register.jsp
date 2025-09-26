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
    <title>HireSense-RegisterPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<%@include file="includes/header.jsp"%>

<div class="container login-container mb-5">
    <div class="login-card">
        <div class="row g-0">
            <!-- Left side - Welcome message -->
            <div class="col-lg-5 login-left">
                <div>
                    <!-- Updated welcome text for registration -->
                    <h2 class="welcome-text">Join HireSense!</h2>
                    <p class="welcome-subtitle">Create your account and start your smart hiring journey with our AI-powered platform.</p>

                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> AI-Powered Candidate Matching</li>
                        <li><i class="fas fa-check-circle"></i> Advanced Analytics Dashboard</li>
                        <li><i class="fas fa-check-circle"></i> Streamlined Interview Process</li>
                        <li><i class="fas fa-check-circle"></i> Team Collaboration Tools</li>
                    </ul>
                </div>
            </div>

            <!-- Right side - Register form -->
            <div class="col-lg-7 login-right">
                <!-- Updated title and subtitle for registration -->
                <h1 class="login-title">Create Account</h1>
                <p class="login-subtitle">Fill in your details to get started</p>

                <!-- Register form -->
                <form>
                    <!-- Added full name field -->
                    <div class="mb-3">
                        <label for="fullname" class="form-label">
                            <i class="fas fa-user me-1"></i>Full Name
                        </label>
                        <input type="text" class="form-control" id="fullname" placeholder="Enter your full name" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">
                            <i class="fas fa-envelope me-1"></i>Email Address
                        </label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">
                            <i class="fas fa-lock me-1"></i>Password
                        </label>
                        <input type="password" class="form-control" id="password" placeholder="Create a password" required>
                    </div>

                    <!-- Changed role field to use form-select class instead of form-control for proper dropdown styling -->
                    <div class="mb-4">
                        <label for="role" class="form-label">
                            <i class="fas fa-user-tag me-1"></i>Select Your Role
                        </label>
                        <select class="form-select" id="role" name="role" required>
                            <option value="">Choose your role...</option>
                            <option value="jobseeker">
                                Job Seeker
                            </option>
                            <option value="employer">
                                Employer
                            </option>
                            <option value="admin">
                                Admin
                            </option>
                        </select>
                    </div>

                    <!-- Updated button text and icon for registration -->
                    <button type="submit" class="btn btn-primary btn-login">
                        <i class="fas fa-user-plus me-2"></i>Create Account
                    </button>
                </form>

                <!-- Updated link text for login -->
                <div class="signup-link">
                    Already have an account? <a href="login.html">Sign in here</a>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>

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
    <title>HireSense-LoginPage</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body >
<%@include file="includes/header.jsp"%>

<!-- Removed entire navbar section -->

<!-- Login Section -->
<div class="container login-container mb-5">
    <div class="login-card">
        <div class="row g-0">
            <!-- Left side - Welcome message -->
            <div class="col-lg-5 login-left">
                <div>
                    <h2 class="welcome-text">Welcome Back!</h2>
                    <p class="welcome-subtitle">Sign in to access your HireSense dashboard and continue your smart hiring journey.</p>

                    <ul class="feature-list">
                        <li><i class="fas fa-check-circle"></i> AI-Powered Candidate Matching</li>
                        <li><i class="fas fa-check-circle"></i> Advanced Analytics Dashboard</li>
                        <li><i class="fas fa-check-circle"></i> Streamlined Interview Process</li>
                        <li><i class="fas fa-check-circle"></i> Team Collaboration Tools</li>
                    </ul>
                </div>
            </div>

            <!-- Right side - Login form -->
            <div class="col-lg-7 login-right">
                <h1 class="login-title">Sign In</h1>
                <p class="login-subtitle">Enter your credentials to access your account</p>

                <!-- Removed Google sign-in button and divider -->

                <!-- Login form -->
                <form>
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
                        <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check">
                            <input class="form-check-input" type="checkbox" id="remember">
                            <label class="form-check-label" for="remember">
                                Remember me
                            </label>
                        </div>
                        <a href="#" class="forgot-password">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn btn-primary btn-login">
                        <i class="fas fa-sign-in-alt me-2"></i>Sign In
                    </button>
                </form>

                <div class="signup-link">
                    Don't have an account? <a href="#register">Create one here</a>
                </div>
            </div>
        </div>
    </div>
</div>


<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>

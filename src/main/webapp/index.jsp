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
    <title>HireSense-Index</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
</head>
<body>
<%@include file="includes/header.jsp"%>

<!-- Hero section with compelling content -->
<section id="home" class="hero-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h1 class="hero-title">Smart Hiring Made Simple</h1>
                <p class="hero-subtitle">
                    Revolutionize your recruitment process with AI-powered candidate matching,
                    streamlined interviews, and data-driven hiring decisions.
                </p>
                <div class="mt-4">
                    <a href="#features" class="btn btn-custom btn-lg">
                        <i class="fas fa-rocket me-2"></i>Get Started
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Fixed features section title to use proper CSS class -->
<section id="features" class="features-section">
    <div class="container">
        <h2 class="section-title text-center">
            <i class="fas fa-star"></i>Why Choose HireSense?
        </h2>
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-brain"></i>
                    </div>
                    <h4>AI-Powered Matching</h4>
                    <p>Our advanced algorithms match candidates with job requirements, ensuring the perfect fit every time.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-clock"></i>
                    </div>
                    <h4>Save Time</h4>
                    <p>Reduce hiring time by 70% with automated screening, scheduling, and candidate evaluation processes.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-chart-line"></i>
                    </div>
                    <h4>Data-Driven Insights</h4>
                    <p>Make informed decisions with comprehensive analytics and reporting on your hiring performance.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-users"></i>
                    </div>
                    <h4>Team Collaboration</h4>
                    <p>Enable seamless collaboration between HR teams, hiring managers, and interviewers.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-shield-alt"></i>
                    </div>
                    <h4>Secure & Compliant</h4>
                    <p>Enterprise-grade security with full compliance to data protection regulations.</p>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="feature-card">
                    <div class="feature-icon">
                        <i class="fas fa-mobile-alt"></i>
                    </div>
                    <h4>Mobile Ready</h4>
                    <p>Access your hiring dashboard anywhere, anytime with our responsive mobile interface.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Added about section that was referenced in navigation -->
<section id="about" class="features-section">
    <div class="container">
        <h2 class="section-title text-center">
            <i class="fas fa-info-circle"></i>About HireSense
        </h2>
        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <p class="lead" style="color: white;">HireSense is revolutionizing the recruitment industry with cutting-edge AI technology and intuitive design. Our platform empowers companies to make smarter hiring decisions while providing candidates with a seamless application experience.</p>
                <p style="color: white;">Founded by industry experts, we understand the challenges of modern recruitment and have built a solution that addresses real-world hiring needs with innovative technology.</p>
            </div>
        </div>
    </div>
</section>

<!-- Added statistics section -->
<section class="stats-section">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <span class="stat-number">10K+</span>
                    <span class="stat-label">Companies Trust Us</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <span class="stat-number">500K+</span>
                    <span class="stat-label">Successful Hires</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <span class="stat-number">70%</span>
                    <span class="stat-label">Time Saved</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stat-item">
                    <span class="stat-number">95%</span>
                    <span class="stat-label">Client Satisfaction</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Added contact section that was referenced in navigation -->
<section id="contact" class="features-section">
    <div class="container">
        <h2 class="section-title text-center">
            <i class="fas fa-envelope"></i>Get In Touch
        </h2>
        <div class="row">
            <div class="col-lg-6 mx-auto">
                <div class="feature-card">
                    <h4>Ready to Transform Your Hiring?</h4>
                    <p>Contact our team to learn how HireSense can streamline your recruitment process.</p>
                    <div class="mt-4">
                        <a href="mailto:contact@hiresense.com" class="btn btn-custom me-3">
                            <i class="fas fa-envelope me-2"></i>Email Us
                        </a>
                        <a href="tel:+1234567890" class="btn btn-outline-primary">
                            <i class="fas fa-phone me-2"></i>Call Us
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
</body>
</html>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="./index.jsp"><i class="fas fa-brain me-2"></i><%= application.getAttribute("appName")%></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <%
                    String role = (String) session.getAttribute("userRole");
                    if(role == null){ // common navbar starts
                %>
                <li class="nav-item">
                    <a class="nav-link" href="./register.jsp"><i class="fas fa-user-plus me-1"></i>Register</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./login.jsp"><i class="fas fa-sign-in-alt me-1"></i>Login</a>
                </li>
                <%
                } // common navbar ends
                else if (role.equals("user")) { // user navbar starts
                %>
                <li class="nav-item">
                    <a class="nav-link" href="UserDashboardServlet"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                </li>
                <%
                } // user navbar ends
                else if (role.equals("employer")) { // employer navbar starts
                %>
                <li class="nav-item">
                    <a class="nav-link" href="EmployerDashboardServlet"><i class="fas fa-tachometer-alt me-1"></i>Dashboard</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                </li>
                <%
                } // employer navbar ends
                else if (role.equals("admin")) { // admin navbar starts
                %>
                <li class="nav-item">
                    <a class="nav-link" href="AdminPanelServlet"><i class="fas fa-user-shield me-1"></i>Admin Panel</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="LogoutServlet"><i class="fas fa-sign-out-alt me-1"></i>Logout</a>
                </li>
                <%
                    }// admin navbar ends
                %>
            </ul>
        </div>
    </div>
</nav>
<script>
    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 70,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Change navbar background on scroll
    window.addEventListener('scroll', function() {
        const navbar = document.querySelector('.navbar');
        if (window.scrollY > 50) {
            navbar.style.background = 'rgba(102, 126, 234, 0.95)';
            navbar.style.boxShadow = '0 4px 20px rgba(0, 0, 0, 0.1)';
        } else {
            navbar.style.background = 'transparent';
            navbar.style.boxShadow = 'none';
        }
    });

    // Hamburger menu functionality
    document.addEventListener('DOMContentLoaded', function() {
        const navbarToggler = document.querySelector('.navbar-toggler');
        const navbarCollapse = document.querySelector('.navbar-collapse');

        // Close menu when clicking on a link
        const navLinks = document.querySelectorAll('.nav-link');
        navLinks.forEach(link => {
            link.addEventListener('click', () => {
                if (navbarCollapse.classList.contains('show')) {
                    navbarToggler.click();
                }
            });
        });
    });

</script>
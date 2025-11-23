<%@ page import="in.hiresense.pojo.UserPojo" %>
<%@ page import="java.util.List" %>
<%@ page import="in.hiresense.pojo.JobPojo" %><%--
  Created by IntelliJ IDEA.
  User: neera
  Date: 9/16/2025
  Time: 6:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AdminPanel | <%=application.getAttribute("appName")%></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <link href="css/styles.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<%@include file="includes/header.jsp"%>
<%
    if(session == null || session.getAttribute("userId") == null || !session.getAttribute("userRole").equals("admin")){
        response.sendRedirect("login.jsp");
        return;
    }
%>
<main class="container py-5 mt-5">
    <h2 class="mb-4 text-white">
        <i class="fas fa-crown me-2"></i>Welcome, <%= session.getAttribute("userName")%>
    </h2>

    <!-- the filter section starts -->
    <div class="admin-filter-card p-4 mb-4">
        <h5 class="text-white mb-3">
            <i class="fas fa-filter me-2"></i>Filter Users
        </h5>
        <form action="AdminPanelServlet" method="get">
            <div class="row g-2">
                <div class="col-md-4">
                    <input
                            type="text"
                            name="search"
                            class="form-control admin-input"
                            placeholder="Search by name or email"
                            value = "${param.search}"
                    />
                </div>
                <div class="col-md-3">
                    <select name="role" class="form-select admin-input" id="">
                        <option class="text-dark" value="" selected>All roles</option>
                        <option class="text-dark" value="employer" ${param.role == 'employer'? 'selected' : ''}>Employer</option>
                        <option class="text-dark" value="user" ${param.role == 'user'? 'selected' : ''}>User</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <select name="status" class="form-select admin-input" id="">
                        <option class="text-dark" value="" selected>All status</option>
                        <option class="text-dark" value="active" ${param.status == 'active'? 'selected' : ''}>Active</option>
                        <option class="text-dark" value="blocked" ${param.role == 'blocked'? 'selected' : ''}>Blocked</option>
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
                <%
                    List<UserPojo> userList = (List<UserPojo>) request.getAttribute("userList");
                    if(userList != null && !userList.isEmpty()){
                        for(UserPojo u : userList){
                %>
                <tr>
                    <td class="text-white"><%=u.getName()%></td>
                    <td class="text-white"><%=u.getEmail()%></td>
                    <td class="text-white"><%=u.getRole()%></td>
                    <td class="text-white"><%=u.getStatus()%></td>
                    <td>
                        <%
                            if(u.getStatus().equals("active")){
                        %>
                        <a href="UpdateUserStatusServlet?userId=<%=u.getId()%>&status=blocked&role=<%=u.getRole()%>" class="btn btn-danger btn-sm">
                            <i class="fas fa-ban me-1"></i>Block
                        </a>
                        <%
                            }else{
                        %>
                        <a href="UpdateUserStatusServlet?userId=<%=u.getId()%>&status=active&role=<%=u.getRole()%>" class="btn btn-success btn-sm">
                            <i class="fas fa-check me-1"></i>Unblock
                        </a>
                        <%
                            }
                        %>
                    </td>
                </tr>
                <%
                        }
                    }else{
                %>
                <tr>
                    <td colspan="5" class="text-center text-warning">
                        <i class="fas fa-exclamation-triangle me-2"></i>No Users found
                    </td>
                </tr>
                <%
                    }
                %>
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
                <%
                    List<JobPojo> jobList = (List<JobPojo>) request.getAttribute("jobList");
                    if(jobList != null && !jobList.isEmpty()){
                        for(JobPojo j : jobList){
                %>
                <tr>
                    <td class="text-white"><%=j.getTitle()%></td>
                    <td class="text-white"><%=j.getCompany()%></td>
                    <td class="text-white"><%=j.getApplicantCount()%></td>
                    <td>
                        <a href="DeleteJobServlet?jobId=<%=j.getId()%>" class="btn btn-danger btn-sm">
                            <i class="fas fa-trash me-1"></i>Remove
                        </a>
                    </td>
                </tr>
                <%
                    }
                }else{
                %>
                <tr>
                    <td colspan="4" class="text-center text-warning">
                        <i class="fas fa-exclamation-triangle me-2"></i>No Job Listings found
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <!-- manage job listing table ends -->
</main>

<%@include file="includes/footer.jsp"%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js" integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous"></script>
<script>

    <%
        if("1".equals(request.getAttribute("userSuccess"))){
    %>
    Swal.fire({icon: 'success', title: 'User Status Updated Successfully', showConfirmButton: false, timer: 1500})
    <%
        }else if("0".equals(request.getAttribute("userSuccess"))){
    %>
    Swal.fire({icon: 'error', title: 'User status update Failed', showConfirmButton: false, timer: 1500})
    <%
        }
    %>
    <%
        if("1".equals(request.getAttribute("delete"))){
    %>
    Swal.fire({icon: 'success', title: 'Job Deleted Successfully', showConfirmButton: false, timer: 1500})
    <%
        }else if("1".equals(request.getAttribute("delete"))){
    %>
    Swal.fire({icon: 'success', title: 'Job Deletion failed', showConfirmButton: false, timer: 1500})
    <%
        }
    %>

</script>
</body>
</html>

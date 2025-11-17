<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="org.json.JSONArray" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>AI Chat | <%=application.getAttribute("appName")%></title>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
            crossorigin="anonymous"
    />
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
    />
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body class="user-dashboard-page">
<%@include file="includes/header.jsp" %>
<main class="container py-5">
    <h2 class="welcome-title mb-4">
        <i class="fas fa-robot me-2"></i><%=application.getAttribute("appName")%> AI Assistant
    </h2>

    <!-- Chat Container -->
    <div class="filter-card glass-card mb-4">
        <h4 class="filter-title text-white mb-3">
            <i class="fas fa-comments me-2"></i>Chat with AI
        </h4>

        <!-- Chat Messages -->
        <div class="chat-messages mb-4" style="max-height: 400px; overflow-y: auto; padding: 1rem; background: rgba(255, 255, 255, 0.1); border-radius: 15px; backdrop-filter: blur(10px);">
            <%
                List<JSONObject> chatHistory = (List<JSONObject>) session.getAttribute("chatHistory");
                if (chatHistory != null && !chatHistory.isEmpty()) {
                    for (JSONObject msg : chatHistory) {
                        String role1 = msg.getString("role");
                        String content = msg.getString("content");
                        boolean isUser = role1.equals("user");
            %>
            <div class="message-wrapper mb-3 <%= isUser ? "text-end" : "text-start" %>">
                <div class="message-content d-inline-block p-3 rounded-3 <%= isUser ? "bg-primary text-white" : "bg-light text-dark" %>" style="max-width: 70%; word-wrap: break-word;">
                    <div class="message-header mb-1">
                        <small class="<%= isUser ? "text-light" : "text-muted" %>">
                            <i class="fas <%= isUser ? "fa-user" : "fa-robot" %> me-1"></i>
                            <%= isUser ? "You" : "AI Assistant" %>
                        </small>
                    </div>
                    <div class="message-text">
                        <%= content.replaceAll("\n", "<br/>") %>
                    </div>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <div class="text-center text-white-50">
                <i class="fas fa-comment-dots fa-3x mb-3"></i>
                <p>Start a conversation with our AI assistant!</p>
            </div>
            <%
                }
            %>
        </div>

        <!-- Chat Input Form -->
        <form method="post" action="chat" class="d-flex gap-2">
            <input
                    type="text"
                    name="message"
                    class="form-control user-input flex-grow-1"
                    placeholder="Type your message here..."
                    autofocus
                    required
            />
            <button type="submit" class="btn btn-gradient">
                <i class="fas fa-paper-plane me-1"></i>Send
            </button>
        </form>
    </div>

    <!-- Quick Actions -->
    <div class="job-card glass-card p-3">
        <h5 class="text-white mb-3">
            <i class="fas fa-lightbulb me-2"></i>Quick Questions
        </h5>
        <div class="row g-2">
            <div class="col-md-6">
                <button class="btn btn-outline-light btn-sm w-100 quick-question" data-question="How do I improve my resume?">
                    <i class="fas fa-file-alt me-1"></i>Resume Tips
                </button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-outline-light btn-sm w-100 quick-question" data-question="What are the latest job market trends?">
                    <i class="fas fa-chart-line me-1"></i>Job Market
                </button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-outline-light btn-sm w-100 quick-question" data-question="How to prepare for technical interviews?">
                    <i class="fas fa-code me-1"></i>Interview Prep
                </button>
            </div>
            <div class="col-md-6">
                <button class="btn btn-outline-light btn-sm w-100 quick-question" data-question="Best skills to learn in 2024?">
                    <i class="fas fa-graduation-cap me-1"></i>Skills Guide
                </button>
            </div>
        </div>
    </div>
</main>
<%@include file="includes/footer.jsp" %>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>

<script>
    // Auto-scroll to bottom of chat
    function scrollToBottom() {
        const chatMessages = document.querySelector('.chat-messages');
        chatMessages.scrollTop = chatMessages.scrollHeight;
    }

    // Scroll to bottom on page load
    window.addEventListener('load', scrollToBottom);

    // Quick question functionality
    document.querySelectorAll('.quick-question').forEach(button => {
        button.addEventListener('click', function() {
            const question = this.getAttribute('data-question');
            const messageInput = document.querySelector('input[name="message"]');
            messageInput.value = question;
            messageInput.focus();
        });
    });

    // Auto-focus on message input
    document.addEventListener('DOMContentLoaded', function() {
        const messageInput = document.querySelector('input[name="message"]');
        messageInput.focus();
    });
</script>
</body>
</html>

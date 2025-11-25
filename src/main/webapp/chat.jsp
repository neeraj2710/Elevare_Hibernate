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
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body.user-dashboard-page {
            min-height: 100vh;
            padding-bottom: 100px;
            display: flex;
            flex-direction: column;
        }

        main {
            width: 100%;
            padding: 0 !important;
            margin: 0 !important;
        }

        .chat-messages-container {
            width: 100%;
            min-height: calc(100vh - 200px);
            padding: 2rem 0;
        }

        .message-wrapper {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto 2.5rem auto;
            padding: 0 3rem;
            animation: slideIn 0.3s ease-out;
        }

        .message-wrapper.user-wrapper {
            display: flex;
            justify-content: flex-end;
            align-items: flex-start;
        }

        .message-wrapper.ai-wrapper {
            display: flex;
            justify-content: flex-start;
            align-items: flex-start;
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .message-content {
            max-width: 65%;
            padding: 0;
            word-wrap: break-word;
            line-height: 1.7;
            color: rgba(255, 255, 255, 0.95);
            position: relative;
        }

        /* User message header - fixed to right */
        .user-wrapper .message-header {
            position: absolute;
            top: -24px;
            right: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
            font-size: 0.85rem;
            opacity: 0.7;
            white-space: nowrap;
        }

        /* AI message header - fixed to left */
        .ai-wrapper .message-header {
            position: absolute;
            top: -24px;
            left: 0;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-weight: 600;
            font-size: 0.85rem;
            opacity: 0.7;
            white-space: nowrap;
        }

        .message-header i {
            font-size: 0.875rem;
        }

        .message-text {
            font-size: 1.05rem;
            white-space: pre-wrap;
            color: rgba(255, 255, 255, 0.95);
            background: rgba(255, 255, 255, 0.1);
            padding: 1rem 1.25rem;
            border-radius: 16px;
            margin-top: 8px;
        }

        .user-wrapper .message-text {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.3) 0%, rgba(118, 75, 162, 0.3) 100%);
            border: 1px solid rgba(102, 126, 234, 0.4);
        }

        .ai-wrapper .message-text {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
        }

        .empty-state {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 8rem 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: rgba(255, 255, 255, 0.7);
        }

        .empty-state i {
            font-size: 5rem;
            margin-bottom: 2rem;
            opacity: 0.6;
        }

        .empty-state h3 {
            color: rgba(255, 255, 255, 0.95);
            margin-bottom: 1rem;
            font-size: 2rem;
            font-weight: 700;
        }

        .empty-state p {
            font-size: 1.1rem;
            margin-bottom: 3rem;
        }

        .quick-actions {
            width: 100%;
            max-width: 800px;
            margin: 0 auto;
            padding: 0 1rem;
        }

        .quick-question {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.25);
            border-radius: 14px;
            padding: 1rem 1.25rem;
            color: rgba(255, 255, 255, 0.95);
            transition: all 0.3s ease;
            text-align: left;
            font-size: 0.95rem;
            margin-bottom: 0.75rem;
            display: block;
            width: 100%;
        }

        .quick-question:hover {
            background: rgba(255, 255, 255, 0.2);
            border-color: rgba(255, 255, 255, 0.4);
            color: white;
            transform: translateX(5px);
        }

        .quick-question i {
            opacity: 0.8;
            margin-right: 0.75rem;
        }

        /* Fixed Input at Bottom */
        .chat-input-fixed {
            position: fixed;
            bottom: 0;
            left: 0;
            right: 0;
            background: rgba(0, 0, 0, 0.4);
            backdrop-filter: blur(20px);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding: 1.5rem 1rem;
            z-index: 999;
        }

        .chat-input-wrapper {
            max-width: 1400px;
            margin: 0 auto;
            display: flex;
            gap: 1rem;
            align-items: flex-end;
            padding: 0 3rem;
        }

        .user-input {
            flex: 1;
            background: rgba(255, 255, 255, 0.95);
            border: 2px solid rgba(255, 255, 255, 0.3);
            border-radius: 16px;
            padding: 1rem 1.25rem;
            font-size: 1rem;
            color: #2d3748;
            transition: all 0.3s ease;
            resize: none;
            min-height: 56px;
            max-height: 200px;
            outline: none;
        }

        .user-input:focus {
            border-color: #667eea;
            box-shadow: 0 0 0 3px rgba(102, 126, 234, 0.15);
            background: white;
        }

        .user-input::placeholder {
            color: #a0aec0;
        }

        .btn-send {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border: none;
            border-radius: 14px;
            width: 56px;
            height: 56px;
            color: white;
            font-size: 1.25rem;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
            cursor: pointer;
        }

        .btn-send:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.4);
        }

        .btn-send:active {
            transform: translateY(0);
        }

        .btn-send:disabled {
            opacity: 0.6;
            cursor: not-allowed;
            transform: none;
        }

        /* Typing Indicator */
        .typing-indicator {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto 2.5rem auto;
            padding: 0 3rem;
            display: none;
        }

        .typing-indicator.active {
            display: block;
            animation: slideIn 0.3s ease-out;
        }

        .typing-bubble {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            padding: 1rem 1.5rem;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 20px;
        }

        .typing-dots {
            display: flex;
            gap: 6px;
            align-items: center;
        }

        .typing-dots span {
            width: 10px;
            height: 10px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.6);
            animation: typing-bounce 1.4s infinite ease-in-out;
        }

        .typing-dots span:nth-child(1) {
            animation-delay: 0s;
        }

        .typing-dots span:nth-child(2) {
            animation-delay: 0.2s;
        }

        .typing-dots span:nth-child(3) {
            animation-delay: 0.4s;
        }

        @keyframes typing-bounce {
            0%, 60%, 100% {
                transform: translateY(0);
                opacity: 0.6;
            }
            30% {
                transform: translateY(-10px);
                opacity: 1;
            }
        }

        @media (max-width: 768px) {
            .message-wrapper {
                padding: 0 1rem;
            }

            .chat-input-wrapper {
                padding: 0 1rem;
            }

            .message-content {
                max-width: 80%;
            }

            .empty-state {
                padding: 4rem 1rem;
            }

            .empty-state h3 {
                font-size: 1.5rem;
            }

            .empty-state i {
                font-size: 3.5rem;
            }

            .chat-input-wrapper {
                gap: 0.75rem;
            }

            .user-input {
                font-size: 0.95rem;
                padding: 0.875rem 1rem;
                min-height: 48px;
            }

            .btn-send {
                width: 48px;
                height: 48px;
                font-size: 1.1rem;
            }

            .typing-indicator {
                padding: 0 1rem;
            }
        }
    </style>
</head>
<body class="user-dashboard-page">
<%@include file="includes/header.jsp" %>

<main>
    <div class="chat-messages-container" id="chatMessages">
        <%
            List<JSONObject> chatHistory = (List<JSONObject>) session.getAttribute("chatHistory");
            if (chatHistory != null && !chatHistory.isEmpty()) {
                for (JSONObject msg : chatHistory) {
                    String role1 = msg.getString("role");
                    String content = msg.getString("content");
                    boolean isUser = role1.equals("user");
        %>
        <div class="message-wrapper <%= isUser ? "user-wrapper" : "ai-wrapper" %>">
            <div class="message-content">
                <div class="message-header">
                    <i class="fas <%= isUser ? "fa-user" : "fa-robot" %>"></i>
                    <span><%= isUser ? "You" : "AI Assistant" %></span>
                </div>
                <div class="message-text"><%= content.replaceAll("\n", "<br/>") %></div>
            </div>
        </div>
        <%
            }
        } else {
        %>
        <div class="empty-state">
            <i class="fas fa-robot"></i>
            <h3>Welcome to AI Assistant</h3>
            <p>Ask me anything about jobs, careers, or professional development</p>

            <div class="quick-actions">
                <button class="btn quick-question" data-question="How do I improve my resume?">
                    <i class="fas fa-file-alt"></i>How do I improve my resume?
                </button>
                <button class="btn quick-question" data-question="What are the latest job market trends?">
                    <i class="fas fa-chart-line"></i>What are the latest job market trends?
                </button>
                <button class="btn quick-question" data-question="How to prepare for technical interviews?">
                    <i class="fas fa-code"></i>How to prepare for technical interviews?
                </button>
                <button class="btn quick-question" data-question="Best skills to learn in 2024?">
                    <i class="fas fa-graduation-cap"></i>Best skills to learn in 2025?
                </button>
            </div>
        </div>
        <%
            }
        %>

        <!-- Typing Indicator -->
        <div class="typing-indicator" id="typingIndicator">
            <div class="typing-bubble">
                <div class="typing-dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        </div>
    </div>
</main>

<!-- Fixed Input at Bottom -->
<div class="chat-input-fixed">
    <form method="post" action="chat" id="chatForm">
        <div class="chat-input-wrapper">
            <textarea
                    name="message"
                    class="user-input"
                    placeholder="Type your message here..."
                    rows="1"
                    id="messageInput"
                    required
            ></textarea>
            <button type="submit" class="btn-send" id="sendBtn">
                <i class="fas fa-arrow-up"></i>
            </button>
        </div>
    </form>
</div>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"
></script>

<script>
    // Auto-scroll to last message on page load
    window.addEventListener('load', function() {
        setTimeout(function() {
            window.scrollTo(0, document.body.scrollHeight);
        }, 100);
    });

    // Auto-resize textarea
    const messageInput = document.getElementById('messageInput');
    messageInput.addEventListener('input', function() {
        this.style.height = 'auto';
        this.style.height = Math.min(this.scrollHeight, 200) + 'px';
    });

    // Handle Enter key (send on Enter, new line on Shift+Enter)
    messageInput.addEventListener('keydown', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            e.preventDefault();
            document.getElementById('chatForm').submit();
        }
    });

    // Form submission
    const chatForm = document.getElementById('chatForm');
    const sendBtn = document.getElementById('sendBtn');
    const typingIndicator = document.getElementById('typingIndicator');

    chatForm.addEventListener('submit', function(e) {
        const message = messageInput.value.trim();
        if (message) {
            sendBtn.disabled = true;
            sendBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i>';

            // Show typing indicator
            typingIndicator.classList.add('active');

            setTimeout(function() {
                window.scrollTo({
                    top: document.body.scrollHeight,
                    behavior: 'smooth'
                });
            }, 100);
        }
    });

    // Quick question functionality
    document.querySelectorAll('.quick-question').forEach(button => {
        button.addEventListener('click', function() {
            const question = this.getAttribute('data-question');
            messageInput.value = question;
            messageInput.style.height = 'auto';
            messageInput.style.height = messageInput.scrollHeight + 'px';
            messageInput.focus();
        });
    });

    // Auto-focus on message input
    document.addEventListener('DOMContentLoaded', function() {
        messageInput.focus();
    });
</script>
</body>
</html>
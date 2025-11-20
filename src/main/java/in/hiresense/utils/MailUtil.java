package in.hiresense.utils;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

    public static void sendTextEmail(String recipientEmailAddresses, String subject, String body) throws MessagingException {
        System.out.println(recipientEmailAddresses+subject+body);
        Message message = new MimeMessage(MailConfig.getSession());
        message.setRecipients(Message.RecipientType.TO,InternetAddress.parse(recipientEmailAddresses));
        message.setSubject(subject);
        message.setText(body);
        Transport.send(message);
        System.out.println("mail Sent successfully");
    }

    public static void sendApplicationConfirmation(String name, String toEmail, String jobTitle,String company) throws MessagingException {
        String subject = "✔️Application Submitted: "+jobTitle;
        String body = "Dear " + name + ",\n\n"
                + "Your application has been successfully submitted for the position of "
                + jobTitle + " at " + company + ".\n"
                + "We have received your details and will review your profile shortly.\n\n"
                + "Thank you for applying.\n"
                + "Best regards,\n"
                + "Team Elevare";
        sendTextEmail(toEmail, subject, body);
    }

    public static void sendNewApplicationNotificationToEmployer(String name, String toEmail, String applicantName,String jobTitle) throws MessagingException {
        String subject = "🔔 New Application Received: " + jobTitle;

        String body = "Dear " + name + ",\n\n"
                + "You have received a new job application.\n\n"
                + "Applicant Name: " + applicantName + "\n"
                + "Applied Position: " + jobTitle + "\n\n"
                + "Please review the candidate's details at your earliest convenience.\n\n"
                + "Best regards,\n"
                + "Team Elevare";
        sendTextEmail(toEmail, subject, body);
    }
    public static void applicationShortlistMail(String name, String toEmail, String jobTitle, String company) throws MessagingException {
        String subject = "🎉 Congratulations! You've Been Shortlisted for " + jobTitle;

        String body = "Dear " + name + ",\n\n"
                + "Congratulations! We are pleased to inform you that your application has been shortlisted.\n\n"
                + "Position: " + jobTitle + "\n"
                + "Company: " + company + "\n\n"
                + "Our team will contact you soon with the next steps in the hiring process.\n\n"
                + "Best regards,\n"
                + "Team Elevare";
        sendTextEmail(toEmail, subject, body);
    }

    public static void applicationRejectionMail(String name, String toEmail, String jobTitle, String company) throws MessagingException {
        String subject = "Update on Your Application for " + jobTitle;

        String body = "Dear " + name + ",\n\n"
                + "Thank you for your interest in the " + jobTitle + " position at " + company + ".\n\n"
                + "After careful consideration, we regret to inform you that we have decided to move forward with other candidates whose qualifications more closely match our current requirements.\n\n"
                + "We appreciate the time and effort you invested in the application process. Your profile has been added to our talent pool, and we encourage you to apply for future opportunities that align with your skills.\n\n"
                + "We wish you all the best in your job search.\n\n"
                + "Best regards,\n"
                + "Team Elevare";
        sendTextEmail(toEmail, subject, body);
    }

    public static void main(String[] args) {
        try {
            sendTextEmail("neerajwadhwaney2003@gmail.com", "Test 2", "Test 2");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

}

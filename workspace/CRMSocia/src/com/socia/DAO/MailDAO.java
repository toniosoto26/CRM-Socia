package com.socia.DAO;

import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailDAO {
	
	private static String USER_NAME = "rosa.mendiola.i"; // gmail user name (just the part before "@gmail.com")
    private static String PASSWORD = "***.,"; // gmail password
    
    public static void main(String[] args) {
        String from = USER_NAME;
        String pass = PASSWORD;
        String[] to = { "rmmi_ros@hotmail.com" }; // list of recipient email addresses
        String subject = "Java send mail example";
        String body = "Welcome to JavaMail!";

        MailDAO mail = new MailDAO();
        mail.sendFromGMail(from, pass, to, to, subject, body);
    }
    
    public void sendFromGMail(String from, String pass, String[] to, String [] cc, String subject, String body) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];
            InternetAddress[] ccAddress = new InternetAddress[cc.length];

            // To get the array of addresses TO
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }
            
            // To get the array of addresses CC
            for( int i = 0; i < cc.length; i++ ) {
            	ccAddress[i] = new InternetAddress(cc[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            
            for( int i = 0; i < ccAddress.length; i++) {
                message.addRecipient(Message.RecipientType.CC, ccAddress[i]);
            }

            message.setSubject(subject);
            message.setContent(body, "text/html");
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException addressException) {
        	addressException.printStackTrace();
        }
        catch (MessagingException messagingException) {
        	messagingException.printStackTrace();
        }
    }

    public void sendFromGMailAttachment(String from, String pass, String[] to, String [] cc, String subject, String body,String urlFile,String myFile) {
        Properties props = System.getProperties();
        String host = "smtp.gmail.com";
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);

        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] toAddress = new InternetAddress[to.length];
            InternetAddress[] ccAddress = new InternetAddress[cc.length];

            // To get the array of addresses TO
            for( int i = 0; i < to.length; i++ ) {
                toAddress[i] = new InternetAddress(to[i]);
            }
            
            // To get the array of addresses CC
            for( int i = 0; i < cc.length; i++ ) {
            	ccAddress[i] = new InternetAddress(cc[i]);
            }

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            
            for( int i = 0; i < ccAddress.length; i++) {
                message.addRecipient(Message.RecipientType.CC, ccAddress[i]);
            }

            // Create a multipart message
            Multipart multipart = new MimeMultipart();

            // Create the message part
            BodyPart messageBodyPart = new MimeBodyPart();
            
            // Part two is attachment
            messageBodyPart = new MimeBodyPart();
            String filename = urlFile; //"cotizacion.xls";
            DataSource source = new FileDataSource(filename);
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(myFile);
            multipart.addBodyPart(messageBodyPart);

            messageBodyPart = new MimeBodyPart();
            messageBodyPart.setContent(body, "text/html");
            multipart.addBodyPart(messageBodyPart);
            /*
            messageBodyPart = new MimeBodyPart();
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(myFile);

            messageBodyPart.setContent(body, "text/html");
            multipart.addBodyPart(messageBodyPart);
            */
            // Send the complete message parts
            message.setContent(multipart);
            message.setSubject(subject);
            
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
        }
        catch (AddressException addressException) {
        	addressException.printStackTrace();
        }
        catch (MessagingException messagingException) {
        	messagingException.printStackTrace();
        }
    }
    
}

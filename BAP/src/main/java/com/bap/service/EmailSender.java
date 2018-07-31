package com.bap.service;

import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.MessagingException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;

import com.bap.domain.Email;

import org.springframework.mail.MailException;


import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
import com.bap.domain.Email;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
 
public class EmailSender  {
 
    
    private JavaMailSender mailSender;
    public void setMailSender(JavaMailSender mailSender) {
    	this.mailSender=mailSender;
    }
 
     
    public void SendEmail(Email email) throws Exception {
        
    	System.out.println(email);
        MimeMessage msg = mailSender.createMimeMessage();
        try {
             
            msg.setSubject(email.getSubject());
            msg.setText(email.getContent());
            msg.setRecipients(MimeMessage.RecipientType.TO , InternetAddress.parse(email.getReceiver()));
            mailSender.send(msg);
             
        }catch(MessagingException e) {
            System.out.println("MessagingException");
            e.printStackTrace();
        }
 
    }
}


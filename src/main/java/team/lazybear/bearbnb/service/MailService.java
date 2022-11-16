package team.lazybear.bearbnb.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Service;

@Service
public class MailService {

	public void checkPayment(String recipient, String hostFirstName, String roomTitle) {
		MimeMessagePreparator messagePreparator = mimeMessage -> {

			String emailTitle = "BearBnB訂房付款資訊-" + roomTitle;
			String emailContent = "<p>感謝您使用BearBnB訂購: " + hostFirstName + "的" + roomTitle + "</p>\n" + "<p>以下為"
					+ hostFirstName + "房東付款資訊，請於付款後聯絡房東：</p>\n" + "<p><strong>[ 中華郵政 ]</strong></p>\n"
					+ "<p><strong>銀行帳號: 9213707270856020</strong></p>\n" + "<p><strong>銀行代碼: 700</strong></p>\n"
					+ "<p>BearBnB團隊敬上</p>";

			MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
			messageHelper.setFrom("bearbnbteam2@gmail.com");
			messageHelper.setTo(recipient);
			messageHelper.setSubject(emailTitle);
			messageHelper.setText(emailContent, true);
		};
		try {
			mailSender.send(messagePreparator);
			// System.out.println("sent");
		} catch (MailException e) {
			// System.out.println(e);
			// runtime exception; compiler will not force you to handle it
		}
	}


 
    private JavaMailSender mailSender;
 
    @Autowired
    public MailService(JavaMailSender mailSender) {
        this.mailSender = mailSender;
    }
 
    public void prepareAndSend(String recipient, String message) {
       MimeMessagePreparator messagePreparator = mimeMessage -> {
             MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
             messageHelper.setFrom("bearbnbteam2@gmail.com");
             messageHelper.setTo(recipient);
             messageHelper.setSubject("SpringMail測試");
             messageHelper.setText(message);
         };
         try {
             mailSender.send(messagePreparator);
             //System.out.println("sent");
         } catch (MailException e) {
             //System.out.println(e);
             // runtime exception; compiler will not force you to handle it
         }
    }
    public void prepareAndSend(String recipient, String subject, String message) {
        MimeMessagePreparator messagePreparator = mimeMessage -> {
              MimeMessageHelper messageHelper = new MimeMessageHelper(mimeMessage);
              messageHelper.setFrom("bearbnbteam2@gmail.com");
              messageHelper.setTo(recipient);
              messageHelper.setSubject(subject);
              messageHelper.setText(message,true);
          };
          try {
              mailSender.send(messagePreparator);
              //System.out.println("sent");
          } catch (MailException e) {
              //System.out.println(e);
              // runtime exception; compiler will not force you to handle it
          }
     }

}
package com.imap.common.util;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
/**
 * 发送邮件的工具类
 */
public class MailUtil {
	public static void sendMail(String email,String subject, String emailMsg)
			throws AddressException, MessagingException {
		// 1.创建一个程序与邮件服务器会话对象 Session
		Properties props = new Properties();
		// 设置邮件传输协议为SMTP
		props.setProperty("mail.transport.protocol", "SMTP");
		// 设置SMTP服务器地址
		props.setProperty("mail.host", "smtp.qq.com");
		// 设置SMTP服务器是否需要用户验证，需要验证设置为true
		props.setProperty("mail.smtp.auth", "true");
		// 创建验证器
		Authenticator auth = new Authenticator() {
			public PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("1456416969@qq.com", "pqxskmcjhpyahidb");
			}
		};
		Session session = Session.getInstance(props, auth);
		// 2.创建一个Message，它相当于是邮件内容
		Message message = new MimeMessage(session);
		message.setFrom(new InternetAddress("1456416969@qq.com")); // 设置发送者
		message.setRecipient(RecipientType.TO, new InternetAddress(email)); // 设置发送方式与接收者
		message.setSubject(subject);
		// message.setText("这是一封激活邮件，请<a href='#'>点击</a>");
		message.setContent(emailMsg, "text/html;charset=utf-8");
		// 3.创建 Transport用于将邮件发送
		Transport.send(message);
	}

	public static void sendAlarm(String email,String name, String siteName, String info) {
		String msg = "站点管理员：%s 请注意</br> 您负责的站点：%s 正处于异常状态，请立即前往站点查看。</br> 详细信息：%s";
		try {
			MailUtil.sendMail(email,"站点异常",String.format(msg, name, siteName, info));
		} catch (MessagingException e) {
			System.out.println("email异常");
			throw new RuntimeException(e);
		}
	}
	public static void main(String[] args) throws MessagingException {
		String name = "李明";
		String siteName = "IMAP_SSPU_001";
		String info = "温度异常: 当前值为：99.96 参考值为：10.0 ~ 60.0";
		sendAlarm("1456416969@qq.com",name, siteName, info);
	}

}

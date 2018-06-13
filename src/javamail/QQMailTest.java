package javamail;

import java.security.GeneralSecurityException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class QQMailTest {

	public static String mail(String email) throws AddressException, MessagingException, GeneralSecurityException {
		// 0.5��props��authenticator����
		Properties props = new Properties();
		props.setProperty("mail.host", "smtp.qq.com");
		props.setProperty("mail.smtp.auth", "true");

		// QQ�����SSL���ܡ�
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);

		// authenticator��������¼�Լ��������ʺ����룬
		Authenticator authenticator = new Authenticator() {
			@Override
			public PasswordAuthentication getPasswordAuthentication() {
				/**
				 * ע�⣬QQ����Ĺ����������������Ѷ����ҳ���߿ͻ��˴򿪵�¼�Ļ����������κεط�
				 * ��¼���䣬�������ʹ����Ȩ�룬��Ȩ������ὲ�⣬vlyvawibbsribgee xxxxxxx:�Լ���QQ�����¼�ʺţ�Ҳ����qq��
				 * yyyyyyy:���룬ʹ����Ȩ���¼��������ʹ��ԭʼ��QQ����
				 */
				return new PasswordAuthentication("296293760", "jqutopurikjebjcf");
			}
		};
		// 1������
		/**
		 * props ����������Ϣ���ʼ��������ĵ�ַ���Ƿ����Ȩ����֤ authenticator Ȩ����֤��Ҳ�����ʺ�������֤ ������Ҫ����������������
		 */
		Session session = Session.getDefaultInstance(props, authenticator);

		// 2�����͵����ݶ���Mesage
		Message message = new MimeMessage(session);
		// 2.1����������˭
		message.setFrom(new InternetAddress("296293760@qq.com"));
		// 2.2 , to:�ռ��� ; cc:���� ; bcc :����.
		/**
		 * �ռ�����˭�� ��һ�������� RecipientType.TO �����ռ��� RecipientType.CC ���� RecipientType.BCC ����
		 * ����AҪ��B���ʼ�������A�����б�Ҫ��Ҫ��CҲ���������ݣ����ڸ�B���ʼ�ʱ��
		 * ���ʼ����ݳ��͸�C����ôCҲ�ܿ����������ˣ�����BҲ��֪��A��C���͹��÷��ʼ� ������ǰ���(����)��C�Ļ�����ôB�Ͳ�֪��A��C���͹��÷��ʼ���
		 * �ڶ������� �ռ��˵ĵ�ַ��������һ��Address[]������װ���ͻ��߰����˵���������������Ⱥ����
		 */
		message.setRecipient(RecipientType.TO, new InternetAddress(email));
		// 2.3 ���⣨���⣩
		message.setSubject("��Զ�̳���ϵͳ��");
		int x = (int) (Math.random() * 9000 + 1000);
		String verify = Integer.toString(x);
		// 2.4 ����
		String str = "��Զ�̳���ϵͳ��<br>������֤��Ϊ��" + verify + "���벻Ҫ����֤��й¶�������ˡ�<br>��Ǳ��˲������ɲ�����ᣡ<br/>";
		message.setContent(str, "text/html;charset=UTF-8");
		// 3������
		Transport.send(message);
		System.out.println("���ͳɹ���");
		return verify;
	}

}
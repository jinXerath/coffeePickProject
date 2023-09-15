package com.cp.mail.service;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {

/*	@Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        // SMTP 설정
        mailSender.setHost("smtp.gmail.com"); // 사용하는 이메일 공급자에 따라 다를 수 있습니다.
        mailSender.setPort(587); // 포트는 일반적으로 587을 사용합니다.

        // 인증 정보 설정 (이메일과 비밀번호)
        mailSender.setUsername("wltns920@gmail.com");
        mailSender.setPassword("fybzbpwcpdjzoexs");

        // 프로퍼티 설정
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.debug", "true"); // 디버그 모드 활성화
        
        return mailSender;
    }
*/
}

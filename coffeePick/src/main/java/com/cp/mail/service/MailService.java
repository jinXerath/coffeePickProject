package com.cp.mail.service;


import java.util.Random;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
@Repository
public class MailService {

    private final JavaMailSender javaMailSender;

    private static final String senderEmail = "wltns0216@naver.com";

    public int CreateMail(String email) {
        System.out.println("성공적으로 구동중...");
        SimpleMailMessage message = new SimpleMailMessage();
        Random random=new Random();
		int randomNumber=random.nextInt(900000)+100000;//6자리 랜덤숫자
		
        
        message.setTo(email); // 받는 사람
        message.setFrom(senderEmail); // 보내는 사람
        message.setSubject("이메일 인증번호 메세지입니다"); // 제목
        message.setText("인증번호는 ["+randomNumber+"] 입니다"); // 내용


        return randomNumber;
    }
}
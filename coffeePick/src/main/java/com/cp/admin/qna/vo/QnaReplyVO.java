package com.cp.admin.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class QnaReplyVO {
	private int qna_no;
	private String qna_reply_content;
	private String qna_reply_img;
	private String qna_reply_regdate;
	private String admin_id;

	private MultipartFile file;
}

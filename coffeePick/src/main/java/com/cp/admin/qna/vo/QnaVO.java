package com.cp.admin.qna.vo;

import org.springframework.web.multipart.MultipartFile;

import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class QnaVO extends CommonVO {
	private int qna_no;
	private String qna_title;
	private String qna_content;
	private String qna_secret;
	private String qna_img;
	private String qna_regdate;
	private String qna_reply_status;
	private String id;

	private MultipartFile file;

	private String member_nickname;
	private String store_name;
}
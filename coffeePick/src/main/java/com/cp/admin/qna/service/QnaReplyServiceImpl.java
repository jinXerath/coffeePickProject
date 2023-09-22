package com.cp.admin.qna.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.admin.qna.dao.QnaDAO;
import com.cp.admin.qna.dao.QnaReplyDAO;
import com.cp.admin.qna.vo.QnaReplyVO;
import com.cp.admin.qna.vo.QnaVO;
import com.cp.common.file.FileUploadUtil;

import lombok.Setter;

@Service
public class QnaReplyServiceImpl implements QnaReplyService {
	
	@Setter(onMethod_= @Autowired)
	private QnaReplyDAO qnaReplyDAO;
	
	@Setter(onMethod_= @Autowired)
	private QnaDAO qnaDAO;
	
	@Override
	public QnaReplyVO memberQnaReplyDetail(QnaReplyVO qrvo) {
		QnaReplyVO replyDetail = qnaReplyDAO.memberQnaReplyDetail(qrvo);
		
		if(replyDetail != null) {
			replyDetail.setQna_reply_content(replyDetail.getQna_reply_content().toString().replaceAll("\n", "<br/>"));
		}
		
		return replyDetail;
	}

	@Override
	public int memberQnaReplyInsert(QnaReplyVO qrvo) throws Exception {
		int result = 0;	
		if (qrvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(qrvo.getFile(), "memberQnaReply"); // board_1658205347977_cat.jpg
			qrvo.setQna_reply_img(fileName);
		}	
		result = qnaReplyDAO.memberQnaReplyInsert(qrvo);
		
		QnaVO qvo = new QnaVO();
		qvo.setQna_no(qrvo.getQna_no());
		qvo.setQna_reply_status("Y");
		qnaDAO.memberQnaReplyStatusUpdate(qvo);
		
		return result;
	}

	@Override
	public int memberQnaReplyUpdate(QnaReplyVO qrvo, String qna_reply_img_delete) throws Exception {
		int result = 0;
		if(qna_reply_img_delete.equals("delete")) {
			FileUploadUtil.fileDelete(qrvo.getQna_reply_img());
			qrvo.setQna_reply_img(null);
		}else {
			if(!qrvo.getFile().isEmpty()) {				// 새롭게 업로드할 파일이 존재하면
				if(!qrvo.getQna_reply_img().isEmpty()) {		// 기존 파일이 존재하면
					FileUploadUtil.fileDelete(qrvo.getQna_reply_img());
				}
				String fileName = FileUploadUtil.fileUpload(qrvo.getFile(), "memberQnaReply");
				qrvo.setQna_reply_img(fileName);
			}
		}
		result = qnaReplyDAO.memberQnaReplyUpdate(qrvo);
		return result;
	}

	@Override
	public int memberQnaReplyDelete(QnaReplyVO qrvo) throws Exception {
		int result = 0;
		
		if(!qrvo.getQna_reply_img().isEmpty()) {
			FileUploadUtil.fileDelete(qrvo.getQna_reply_img());
		}
		result = qnaReplyDAO.memberQnaReplyDelete(qrvo);
		
		QnaVO qvo = new QnaVO();
		qvo.setQna_no(qrvo.getQna_no());
		qvo.setQna_reply_status("N");
		qnaDAO.memberQnaReplyStatusUpdate(qvo);
		
		return result;
	}
	
	
	
	// 기업 회원
	@Override
	public QnaReplyVO corpQnaReplyDetail(QnaReplyVO qrvo) {
		QnaReplyVO replyDetail = qnaReplyDAO.corpQnaReplyDetail(qrvo);
		
		if(replyDetail != null) {
			replyDetail.setQna_reply_content(replyDetail.getQna_reply_content().toString().replaceAll("\n", "<br/>"));
		}
		
		return replyDetail;
	}
	
	@Override
	public int corpQnaReplyInsert(QnaReplyVO qrvo) throws Exception {
		int result = 0;	
		if (qrvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(qrvo.getFile(), "corpQnaReply"); // board_1658205347977_cat.jpg
			qrvo.setQna_reply_img(fileName);
		}	
		result = qnaReplyDAO.corpQnaReplyInsert(qrvo);
		
		QnaVO qvo = new QnaVO();
		qvo.setQna_no(qrvo.getQna_no());
		qvo.setQna_reply_status("Y");
		qnaDAO.corpQnaReplyStatusUpdate(qvo);
		
		return result;
	}
	
	@Override
	public int corpQnaReplyUpdate(QnaReplyVO qrvo, String qna_reply_img_delete) throws Exception {
		int result = 0;
		if(qna_reply_img_delete.equals("delete")) {
			FileUploadUtil.fileDelete(qrvo.getQna_reply_img());
			qrvo.setQna_reply_img(null);
		}else {
			if(!qrvo.getFile().isEmpty()) {				// 새롭게 업로드할 파일이 존재하면
				if(!qrvo.getQna_reply_img().isEmpty()) {		// 기존 파일이 존재하면
					FileUploadUtil.fileDelete(qrvo.getQna_reply_img());
				}
				String fileName = FileUploadUtil.fileUpload(qrvo.getFile(), "corpQnaReply");
				qrvo.setQna_reply_img(fileName);
			}
		}
		result = qnaReplyDAO.corpQnaReplyUpdate(qrvo);
		return result;
	}
	
	@Override
	public int corpQnaReplyDelete(QnaReplyVO qrvo) throws Exception {
		int result = 0;
		
		if(!qrvo.getQna_reply_img().isEmpty()) {
			FileUploadUtil.fileDelete(qrvo.getQna_reply_img());
		}
		result = qnaReplyDAO.corpQnaReplyDelete(qrvo);
		
		QnaVO qvo = new QnaVO();
		qvo.setQna_no(qrvo.getQna_no());
		qvo.setQna_reply_status("N");
		qnaDAO.corpQnaReplyStatusUpdate(qvo);
		
		return result;
	}
	
}

package com.cp.admin.qna.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cp.admin.qna.dao.QnaDAO;
import com.cp.admin.qna.vo.QnaVO;
import com.cp.common.file.FileUploadUtil;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Service
public class QnaServiceImpl implements QnaService {
	
	@Setter(onMethod_= @Autowired)
	private QnaDAO qnaDAO;

	@Override
	public List<QnaVO> memberQnaList(QnaVO qvo) {
		List<QnaVO> memberQnaList = qnaDAO.memberQnaList(qvo);
		return memberQnaList;
	}

	@Override
	public int memberQnaCnt(QnaVO qvo) {
		int total = qnaDAO.memberQnaCnt(qvo);
		return total;
	}

	@Override
	public QnaVO memberQnaDetail(QnaVO qvo) {
		QnaVO detail = qnaDAO.memberQnaDetail(qvo);
		
		if(detail != null) {
			detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br/>"));
		}
		
		return detail;
	}

	@Override
	public int memberQnaInsert(QnaVO qvo) throws Exception{
		int result = 0;	
		if (qvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "memberQna"); // board_1658205347977_cat.jpg
			qvo.setQna_img(fileName);
		}	
		result = qnaDAO.memberQnaInsert(qvo);
		return result;
	}
	@Override
	public QnaVO memberQnaUpdateForm(QnaVO qvo) {
		QnaVO updateData = null;
		updateData = qnaDAO.memberQnaDetail(qvo);
		return updateData;
	}
	
	@Override
	public int memberQnaUpdate(QnaVO qvo, String qna_img_delete) throws Exception{
		int result = 0;
		if(qna_img_delete.equals("delete")) {
			FileUploadUtil.fileDelete(qvo.getQna_img());
			qvo.setQna_img(null);
		}else {
			if(!qvo.getFile().isEmpty()) {				// 새롭게 업로드할 파일이 존재하면
				if(!qvo.getQna_img().isEmpty()) {		// 기존 파일이 존재하면
					FileUploadUtil.fileDelete(qvo.getQna_img());
				}
				String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "memberQna");
				qvo.setQna_img(fileName);
			}
		}
		result = qnaDAO.memberQnaUpdate(qvo);
		return result;
	}

	@Override
	public int memberQnaDelete(QnaVO qvo) throws Exception {
		int result = 0;
		
		if(!qvo.getQna_img().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQna_img());
		}
		result = qnaDAO.memberQnaDelete(qvo);
		return result;
	}

	@Override
	public List<QnaVO> corpQnaList(QnaVO qvo) {
		List<QnaVO> corpQnaList = qnaDAO.corpQnaList(qvo);
		return corpQnaList;
	}

	@Override
	public int corpQnaCnt(QnaVO qvo) {
		int total = qnaDAO.corpQnaCnt(qvo);
		return total;
	}

	@Override
	public QnaVO corpQnaDetail(QnaVO qvo) {
		QnaVO detail = qnaDAO.corpQnaDetail(qvo);
		if(detail != null) {
			detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br/>"));
		}
		return detail;
	}

	@Override
	public int corpQnaInsert(QnaVO qvo) throws Exception {
		int result = 0;	
		if (qvo.getFile().getSize() > 0) {
			String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "corpQna"); // board_1658205347977_cat.jpg
			qvo.setQna_img(fileName);
		}	
		result = qnaDAO.corpQnaInsert(qvo);
		return result;
	}

	@Override
	public QnaVO corpQnaUpdateForm(QnaVO qvo) {
		QnaVO updateData = null;
		updateData = qnaDAO.corpQnaDetail(qvo);
		return updateData;
	}

	@Override
	public int corpQnaUpdate(QnaVO qvo, String qna_img_delete) throws Exception {
		int result = 0;
		if(qna_img_delete.equals("delete")) {
			FileUploadUtil.fileDelete(qvo.getQna_img());
			qvo.setQna_img(null);
		}else {
			if(!qvo.getFile().isEmpty()) {				// 새롭게 업로드할 파일이 존재하면
				if(!qvo.getQna_img().isEmpty()) {		// 기존 파일이 존재하면
					FileUploadUtil.fileDelete(qvo.getQna_img());
				}
				String fileName = FileUploadUtil.fileUpload(qvo.getFile(), "corpQna");
				qvo.setQna_img(fileName);
			}
		}
		result = qnaDAO.corpQnaUpdate(qvo);
		return result;
	}

	@Override
	public int corpQnaDelete(QnaVO qvo) throws Exception {
		int result = 0;
		
		if(!qvo.getQna_img().isEmpty()) {
			FileUploadUtil.fileDelete(qvo.getQna_img());
		}
		result = qnaDAO.corpQnaDelete(qvo);
		return result;
	}


}

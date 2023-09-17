package com.cp.admin.qna.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.cp.admin.qna.vo.QnaVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
public class QnaTest {

	@Setter(onMethod_= @Autowired)
	private QnaDAO qnaDAO;
	

}

package com.cp.user.store.vo;

import org.springframework.web.multipart.MultipartFile;

import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

/* equals와 hashCode 메소드 자동 생성 시 부모 클래스의 필드까지 감안할지 안 할지에 대해서 설정시
 * callSuper = true로 설정하면 부모 클래스 필드 값들도 동일 한지 체크하며,
 * callSuper = false로 설정(기본값)하면 자신 클래스의 필드 값들만 고려한다*/

@Data
@EqualsAndHashCode(callSuper = false)
public class StoreVO extends CommonVO{
	private  String store_id           		="";		//매장정보 id
	private  String store_name	   			="";		//매장이름
	private  String store_addr				="";		//매장주소
	private  String store_phone				="";		//매장전화번호
	private  String store_content			="";		//매장설명
	private  String store_content_detail	="";		//매장상세설명
	private  String store_operate_hour		="";		//매장운영시간
	private  String store_operate_status	="";		//매장운영상태
	private  String store_regdate			="";		//매장등록일
	private  String corp_id					="";		//기업회원아이디
	private  String store_img				="";		//매장이미지
	
	private MultipartFile file;         				//파일 업로드를 위한 필드
}

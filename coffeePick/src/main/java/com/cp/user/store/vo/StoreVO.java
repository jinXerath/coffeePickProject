package com.cp.user.store.vo;

import org.springframework.web.multipart.MultipartFile;


import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class StoreVO {
    private String store_id				="";
    private String store_name			="";
    private String store_addr			="";
    private String store_phone			="";
    private String store_content		="";
    private String store_content_detail	="";
    private String store_operate_hour	="";
    private String store_operate_status	="";
    private String store_regdate		="";
    private String corp_id				="";
    
    
    private String store_img			="";
    private MultipartFile file;	    
}
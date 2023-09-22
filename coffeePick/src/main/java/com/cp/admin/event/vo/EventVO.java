package com.cp.admin.event.vo;

import lombok.Data;

@Data
public class EventVO {
	private int envet_no ;
	private String event_title = "";
	private String event_content = "";
	private String event_readcnt = "";
	private String event_regdate = "";
	private String img = "";
}

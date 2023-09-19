package com.cp.user.pickmoney.vo;

import lombok.Data;

@Data
public class PickmoneyHistoryVO {
	private int pickmoney_history_no;
	private String pickmoney_history_date;
	private int pickmoney_history_amount;
	private String pickmoney_history_reason;
	private String member_id;
}

package com.cp.user.point.vo;

import lombok.Data;

@Data
public class PointHistoryVO {
	private int point_history_no;
	private int point_history_amount;
	private String point_history_date;
	private String point_history_reason;
	private String member_id;
}

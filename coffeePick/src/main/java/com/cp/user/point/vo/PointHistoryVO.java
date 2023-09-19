package com.cp.user.point.vo;

import com.cp.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PointHistoryVO extends CommonVO {
	private int point_history_no;
	private int point_history_amount;
	private String point_history_date;
	private String point_history_reason;
	private String member_id;
}

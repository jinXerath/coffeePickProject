package com.cp.user.point.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class PointVO {
	private String member_id;
	private int point_total;
}

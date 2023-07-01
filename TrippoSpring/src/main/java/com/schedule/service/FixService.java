package com.schedule.service;

import java.util.List;

import com.schedule.db.FixVO;

public interface FixService {
	public List<FixVO> getFixList(String pageId);
	public int insertFixList(FixVO fix);
	public int updateFixList(FixVO fix);
	public int deleteFixList(FixVO fix);
}

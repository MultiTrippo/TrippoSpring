package com.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.schedule.db.FixVO;

@Mapper
public interface FixMapper {
	public List<FixVO> getFixList(String pageId);
	public int insertFixList(FixVO fix);
	public int updateFixList(FixVO fix);
	public int deleteFixList(FixVO fix);
}

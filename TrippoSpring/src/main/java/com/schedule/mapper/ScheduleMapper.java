package com.schedule.mapper;

import java.util.List;

import com.schedule.db.ScheduleListVO;

public interface ScheduleMapper {
	public List<ScheduleListVO>  getAllScheduleList(String id);
	public int insertSchedule(ScheduleListVO s);
	public int updateSchedule(ScheduleListVO s);
	public int deleteSchedule(ScheduleListVO s);
}

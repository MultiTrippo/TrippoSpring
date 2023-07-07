package com.schedule.service;

import java.util.List;

import com.schedule.db.ScheduleListVO;

public interface ScheduleService {
	public List<ScheduleListVO>  getAllScheduleList(String id);
	public int insertSchedule(ScheduleListVO s);
	public int updateSchedule(ScheduleListVO s);
	public int deleteSchedule(ScheduleListVO s);

}

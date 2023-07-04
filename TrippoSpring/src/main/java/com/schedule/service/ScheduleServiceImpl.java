package com.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.schedule.db.ScheduleListVO;
import com.schedule.mapper.ScheduleMapper;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{
	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Override
	public List<ScheduleListVO>  getAllScheduleList(String id){
		return this.scheduleMapper.getAllScheduleList(id);
	}
	
	@Override
	public int insertSchedule(ScheduleListVO s) {
		return this.scheduleMapper.insertSchedule(s);
	}
	
	@Override
	public int updateSchedule(ScheduleListVO s) {
		return this.scheduleMapper.updateSchedule(s);
	}
	
	@Override
	public int deleteSchedule(ScheduleListVO s) {
		return this.scheduleMapper.deleteSchedule(s);
	}

}

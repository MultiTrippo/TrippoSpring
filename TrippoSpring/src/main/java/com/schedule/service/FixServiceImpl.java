package com.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.schedule.db.FixVO;
import com.schedule.mapper.FixMapper;

@Service("fixService")
public class FixServiceImpl implements FixService{

	@Autowired
	private FixMapper fixMapper;
	
	@Override
	public List<FixVO> getFixList(String pageId){
		System.out.println("fix 리스트 불러오기 " + pageId);
		return this.fixMapper.getFixList(pageId);
	}
	
	@Override
	public int insertFixList(FixVO fix) {
		return this.fixMapper.insertFixList(fix);
	}
	
	@Override
	public int updateFixList(FixVO fix) {
		return this.fixMapper.updateFixList(fix);
	}
	
	@Override
	public int deleteFixList(FixVO fix) {
		return this.fixMapper.deleteFixList(fix);
	}
}

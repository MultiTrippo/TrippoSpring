package com.schedule.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.schedule.db.*;
import com.schedule.mapper.EtcMapper;


@Service("etcService")
public class EtcServiceImpl implements EtcService{

	@Autowired
	private EtcMapper etcMapper;
	
	@Override
	public List<EtcVO> getEtcList(String pageId){
		System.out.println("리스트 불러오기" + pageId);
		return this.etcMapper.getEtcList(pageId);
	}
	
	@Override
	public int insertEtcList(EtcVO etc) {
		return this.etcMapper.insertEtcList(etc);
	}
	
	@Override
	public int updateEtcList(EtcVO etc_id) {
		return this.etcMapper.updateEtcList(etc_id);
	}
	
	@Override
	public int deleteEtcList(EtcVO etc_id) {
		return this.etcMapper.deleteEtcList(etc_id);
	}
}
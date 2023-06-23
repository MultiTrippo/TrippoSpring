package com.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.schedule.db.EtcVO;

@Mapper
public interface EtcMapper {
	public List<EtcVO> getEtcList(String pageId);
	public int insertEtcList(EtcVO etc);
	public int updateEtcList(EtcVO etc_id);
	public int deleteEtcList(EtcVO etc_id);
}

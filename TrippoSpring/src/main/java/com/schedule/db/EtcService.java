package com.schedule.db;

import java.util.List;

public interface EtcService {
	public List<EtcVO> getEtcList(String pageId);
	public int insertEtcList(EtcVO etc);
	public int updateEtcList(EtcVO etc_id);
	public int deleteEtcList(EtcVO etc_id);
}

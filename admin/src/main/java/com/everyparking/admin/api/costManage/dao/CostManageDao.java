package com.everyparking.admin.api.costManage.dao;

import java.util.HashMap;
import java.util.List;

public interface CostManageDao {

	public List<HashMap<String, Object>> selectListCost(HashMap<String, Object> params) throws Exception;
	public int selectListCountCost(HashMap<String, Object> params) throws Exception;
	public HashMap<String, Object> selectOneCost(HashMap<String, Object> params) throws Exception;
    public int deleteCost(HashMap<String,Object> params) throws Exception;
    public int deleteCostRese(HashMap<String,Object> params) throws Exception;
   
}


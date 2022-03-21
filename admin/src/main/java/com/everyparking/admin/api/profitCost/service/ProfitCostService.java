package com.everyparking.admin.api.profitCost.service;

import java.util.HashMap;
import java.util.List;

public interface ProfitCostService {

    public List<HashMap<String, Object>> selectListProfitCost(HashMap<String, Object> params) throws Exception;

    public int selectListCountProfitCost(HashMap<String, Object> params) throws Exception;

    public HashMap<String, Object> selectOneProfitCost(HashMap<String, Object> params) throws Exception;

    public int deleteProfitCost(HashMap<String, Object> params) throws Exception;
    
    // 작성자 : 전지나 | 내용 : profitChart
    public List<HashMap<String, Object>> selectProfitChartDataByMonth() throws Exception;
}
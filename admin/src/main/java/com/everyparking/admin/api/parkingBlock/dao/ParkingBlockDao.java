package com.everyparking.admin.api.parkingBlock.dao;

import java.util.HashMap;
import java.util.List;

public interface ParkingBlockDao {
	
	public List<HashMap<String, Object>> selectListParkingBlock(HashMap<String, Object> params) throws Exception;
	public int selectListCountParkingBlock(HashMap<String, Object> params) throws Exception;
	public HashMap<String, Object> selectOneParkingBlock(HashMap<String, Object> params) throws Exception;
    public int deleteParkingBlock(HashMap<String,Object> params) throws Exception;
}

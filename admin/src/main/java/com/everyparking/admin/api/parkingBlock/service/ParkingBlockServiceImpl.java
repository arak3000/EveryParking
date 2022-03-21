package com.everyparking.admin.api.parkingBlock.service;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.parkingBlock.dao.ParkingBlockDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class ParkingBlockServiceImpl implements ParkingBlockService {
	
	@Autowired
	ParkingBlockDao parkingBlockDao;

	@Override
	public List<HashMap<String, Object>> selectListParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.selectListParkingBlock(params);
	}

	@Override
	public int selectListCountParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.selectListCountParkingBlock(params);
	}

	@Override
	public HashMap<String, Object> selectOneParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.selectOneParkingBlock(params);
	}

	@Override
	public int deleteParkingBlock(HashMap<String, Object> params) throws Exception {
		return parkingBlockDao.deleteParkingBlock(params);
	}
	
	

}

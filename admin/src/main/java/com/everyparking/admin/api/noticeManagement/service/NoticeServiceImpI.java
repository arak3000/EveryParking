package com.everyparking.admin.api.noticeManagement.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.everyparking.admin.api.noticeManagement.dao.NoticeDao;

@Service
@Transactional(rollbackFor = Exception.class)
public class NoticeServiceImpI implements NoticeService{

	@Autowired
	private NoticeDao noticedao;	
	
	
	@Override
	public List<HashMap<String, Object>> selectListNoti(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.selectListNoti(params);
	}

	@Override
	public int selectListCountNoti(HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return noticedao.selectListCountNoti(params);
	}

	@Override
	public int updateNoti(HashMap<String, Object> params) throws Exception  {
		return noticedao.updateNoti(params);
	}

	@Override
	public int deleteNoti(HashMap<String, Object> params) throws Exception {
		return noticedao.deleteNoti(params);
	}

	@Override
	public HashMap<String, Object> getNotice(int NOTI_SEQ) throws Exception {
		HashMap<String, Object> result = noticedao.getNotice(NOTI_SEQ);
		return result;
	}

	@Override
	public int insertNoti(HttpServletRequest request, HashMap<String, Object> params) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int notiReadCount(int NOTI_SEQ) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
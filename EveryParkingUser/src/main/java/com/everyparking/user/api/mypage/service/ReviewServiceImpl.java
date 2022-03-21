package com.everyparking.user.api.mypage.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Service
@Transactional(rollbackFor = Exception.class)
public class ReviewServiceImpl implements ReviewService{

    @Override
    public HashMap<String, Object> getReservationInfo(HashMap<String, Object> params) {
        return null;
    }
}

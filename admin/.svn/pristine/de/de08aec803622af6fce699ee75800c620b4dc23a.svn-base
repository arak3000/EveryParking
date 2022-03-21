package com.everyparking.admin.api.parkingBlock.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.everyparking.admin.api.parkingBlock.service.ParkingBlockService;
import com.everyparking.admin.api.profitCost.controller.ProfitCostRestController;
import com.everyparking.admin.framework.common.controller.BaseController;
import com.everyparking.admin.framework.common.vo.Ajax;

@RestController
@RequestMapping(value="/parkingBlock")
public class ParkingBlockRestController extends BaseController {

	private static final Logger logger = LoggerFactory.getLogger(ParkingBlockRestController.class);

	@Autowired
	ParkingBlockService parkingBlockService;

    @RequestMapping("/selectListParkingBlock")
    public ModelAndView selectListParkingBlock(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(parkingBlockService.selectListParkingBlock(params), parkingBlockService.selectListCountParkingBlock(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/selectOneParkingBlock")
    public ModelAndView selectOneParkingBlock(@RequestBody HashMap<String,Object> params) throws Exception {
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(parkingBlockService.selectOneParkingBlock(params));
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.SEARCH.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
    
    
    
    @RequestMapping("/deleteParkingBlock")
    public ModelAndView deleteParkingBlock(@RequestBody HashMap<String,Object> params) throws Exception{
        ModelAndView mav = super.createMav();
        try {
            mav = super.createMav(parkingBlockService.deleteParkingBlock(params));
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_SUCCESS);
        }catch (Exception e){
            logger.error(e.getMessage());
            super.setMessage(mav, Ajax.DELETE.TEXT+"."+Ajax.TYPE_FAIL);
        }
        return mav;
    }
    









}

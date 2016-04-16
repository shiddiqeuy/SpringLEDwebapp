package com.shiddiq.service.impl;
import com.shiddiq.dao.LampDAO;
import com.shiddiq.entity.Lamp;
import com.shiddiq.service.LampService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
/**
 * @author shiddiq 
 * @version 2.0
 */
@Service
@Transactional
public class LampServiceImpl implements LampService {
	
	public LampServiceImpl() {
		System.out.println("LampServiceImpl()");
	}
	
    @Autowired
    private LampDAO lampDAO;

    @Override
    public long createLamp(Lamp lamp) {
        return lampDAO.createLamp(lamp);
    }
    @Override
    public Lamp updateLamp(Lamp lamp) {
        return lampDAO.updateLamp(lamp);
    }
    @Override
    public void deleteLamp(long id) {
        lampDAO.deleteLamp(id);
    }
    @Override
    public List<Lamp> getAllLamps() {
        return lampDAO.getAllLamps();
    }
    @Override
    public Lamp getLamp(long id) {
        return lampDAO.getLamp(id);
    }    
    @Override
    public List<Lamp> getAllLamps(String ledid) {
    	return lampDAO.getAllLamps(ledid);
    }
}

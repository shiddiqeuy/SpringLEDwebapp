/**
 * 
 */
package com.shiddiq.dao.impl;

import com.shiddiq.dao.LampDAO;
import com.shiddiq.entity.Lamp;
import com.shiddiq.util.HibernateUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;

/**
 * @author shiddiq
 * @version 3.0
 */

@Repository
public class LampDAOImpl implements LampDAO {
    
	public LampDAOImpl() {
    	System.out.println("LampDAOImpl");
    }
	
	@Autowired
    private HibernateUtil hibernateUtil;

    @Override
    public long createLamp(Lamp lamp) {        
        return (long) hibernateUtil.create(lamp);
    }
    
    @Override
    public Lamp updateLamp(Lamp lamp) {        
        return hibernateUtil.update(lamp);
    }
    
    @Override
    public void deleteLamp(long id) {
        Lamp lamp = new Lamp();
        lamp.setId(id);
        hibernateUtil.delete(lamp);
    }
    
    @Override
    public List<Lamp> getAllLamps() {        
        return hibernateUtil.fetchAll(Lamp.class);
    }
    
    @Override
    public Lamp getLamp(long id) {
        return hibernateUtil.fetchById(id, Lamp.class);
    }

	@SuppressWarnings("unchecked")
	@Override
	public List<Lamp> getAllLamps(String ledid) { 
		String query = "SELECT e.* FROM lamps e WHERE e.ledid like '%"+ ledid +"%'";
		List<Object[]> lampObjects = hibernateUtil.fetchAll(query);
		List<Lamp> lamps = new ArrayList<Lamp>();
		for(Object[] lampObject: lampObjects) {
			Lamp lamp = new Lamp();
           
			int dimming = ((int) lampObject[0]);
            int voltage = ((int) lampObject[1]);
            int current = ((int) lampObject[2]);
            float temperature = ((float) lampObject[3]);
            float humidity = ((float) lampObject[4]);
            String server_ip = ((String) lampObject[5]);
            String server_port = ((String) lampObject[6]);
            int report_cycle_time = ((int) lampObject[7]);
            String location = (String) lampObject[9];           
            long id = ((BigInteger) lampObject[10]).longValue();   
            int led = (int) lampObject[11];
            int groupid = (int) lampObject[12];
            String logtime = (String) lampObject[13];
            String net = (String) lampObject[14];
            String status = (String) lampObject[15];
            String lat = (String) lampObject[16];
            String lng = (String) lampObject[17];
            int lampcondition = ((int) lampObject[18]);
            float dustconcentration = ((float) lampObject[19]);
            String ledtype = (String) lampObject[20];
            String lampcontrol = ((String) lampObject[18]);

            lamp.setId(id);
            lamp.setLedid(led);
            lamp.setGroupid(groupid);
            lamp.setLocation(location);
			lamp.setDimming(dimming);
			lamp.setVoltage(voltage);
            lamp.setCurrent(current);
            lamp.setTemperature(temperature);
            lamp.setHumidity(humidity);
            lamp.setServer_ip(server_ip);
            lamp.setServer_port(server_port);
            lamp.setReportcycletime(report_cycle_time);
            lamp.setLogtime(logtime);
            lamp.setNet(net);
            lamp.setStatus(status);
            lamp.setLat(lat);
            lamp.setLng(lng);
            lamp.setLampcondition(lampcondition);
            lamp.setDustconcentration(dustconcentration);
            lamp.setLedtype(ledtype);
            lamp.setLampcontrol(lampcontrol);
			lamps.add(lamp);
		}
		System.out.println(lamps);
		return lamps;
	}
}
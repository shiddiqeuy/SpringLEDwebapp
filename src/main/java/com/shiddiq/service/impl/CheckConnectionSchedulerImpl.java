package com.shiddiq.service.impl;

import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.shiddiq.SpringRest;
import com.shiddiq.entity.Lamp;
import com.shiddiq.service.LampService;
import com.shiddiq.service.CheckConnectionScheduler;

import org.jboss.logging.Logger;

@Service
public class CheckConnectionSchedulerImpl implements CheckConnectionScheduler {
	
	 private static final Logger logger = Logger.getLogger(CheckConnectionSchedulerImpl.class);
	 @Autowired
	    private LampService lampService;
	 
	 @Scheduled(fixedRate = 60000)//edited by sid scheduler will work every 15 minutes = 900000
	 public void getClientConnStatus() {
			int timeOut = 3000; // I recommend 3 seconds at least
	    	
		    List<Lamp> lampList = lampService.getAllLamps();
		    for(Lamp lamp:lampList){
		    	System.out.println(lamp);
		    	boolean statusconn = false;
		    
		    	String host = lamp.getServer_ip();
		    	//String host = "172.16.0.2"
		    
				try {
					statusconn = InetAddress.getByName(host).isReachable(timeOut);
				} catch (UnknownHostException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			    	if (statusconn==true){
			    		lamp.setStatus("connected");
			    	}else{
			    		lamp.setStatus("disconnect");
			    	}
			    	System.out.println("****************************");
				    System.out.println("masuk CheckConnectionSchedulerImpl get ip"+host);
				    System.out.println("masuk CheckConnectionSchedulerImpl get status connection"+statusconn);
				    logger.info("=====================================================================");
			        logger.info("Real time data hit CheckConnecctionScheduler");
			        logger.info("masuk CheckConnectionSchedulerImpl get ip = "+host);   
			        logger.info("masuk CheckConnectionSchedulerImpl get status connection = "+statusconn);
			        logger.info("======================================================================");
		    	//lamp.setDustcondition(0);//add by shiddiq to avoid null error
		    	lampService.updateLamp(lamp);
		    }
		    System.out.println("****************************");
		    System.out.println("masuk CheckConnectionSchedulerImpl");
		    System.out.println("check connection client sukses shiddiq " + new Date());
	    }
	 
}

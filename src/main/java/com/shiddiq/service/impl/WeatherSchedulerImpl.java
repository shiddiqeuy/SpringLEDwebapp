package com.shiddiq.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.shiddiq.SpringRest;
import com.shiddiq.entity.Lamp;
import com.shiddiq.service.LampService;
import com.shiddiq.service.WeatherScheduler;

@Service
public class WeatherSchedulerImpl implements WeatherScheduler {
	 @Autowired
	    private LampService lampService;
	    private SpringRest lampRest;
	    
	    @Scheduled(fixedRate = 3600000)//edited by sid scheduler will work only hourly=3600000
	    public void getWeather() {
		    List<Lamp> lampList = lampService.getAllLamps();
		    for(Lamp lamp:lampList){
		    	System.out.println(lamp);
		    	long idtemp = lamp.getId();
		    	String lattemp = lamp.getLat();
		    	String lngtemp = lamp.getLng();
		    	String tempout = lampRest.getWeatherCurrent(lattemp, lngtemp);
		    	String tempf   = lampRest.getPM10(lattemp, lngtemp);
		    	String humidity = tempout.split(",")[0];
		    	String temperature = tempout.split(",")[1];
		    	
		    	lamp.setHumidity(Float.parseFloat(humidity));
		    	lamp.setTemperature(Float.parseFloat(temperature));
		    	lamp.setDustconcentration(Float.parseFloat(tempf));
		    	//lamp.setDustcondition(0);//add by shiddiq to avoid null error
		    	lampService.updateLamp(lamp);
		    }
		    System.out.println("****************************");
		    System.out.println("update weather sukses shiddiq " + new Date());
	    }

}

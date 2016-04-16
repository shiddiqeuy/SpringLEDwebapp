package com.shiddiq.controller;
import com.shiddiq.entity.Lamp;
import com.shiddiq.service.LampService;
import com.shiddiq.service.impl.WeatherSchedulerImpl;
//add by sy sid 02022016 to create json rest service 
import com.shiddiq.SpringRest;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


//add by sy sid 02022016 to create json rest service 
//import org.springframework.web.bind.annotation.RestController;
//add by sy sid 02022016 to create json rest service 

/**
 * @author shiddiq 16 April 2016 shiddiqitt@gmail.com
 * @version 4.0
 * @ 16 April 2016
 * 
 */
@Controller
@EnableScheduling
public class LampController {
	
	private static final Logger logger = Logger.getLogger(LampController.class);
	
	public LampController() {
		System.out.println("LampController()");
	}

    @Autowired
    private LampService lampService;
    private SpringRest lampRest;
//    @Autowired
//    private WeatherSchedulerImpl WS;

    @RequestMapping("createLamp")
    public ModelAndView createLamp(@ModelAttribute Lamp lamp) {
    	logger.info("Creating Lamp. Data: "+lamp);
        return new ModelAndView("lampForm");
    }
    
    @RequestMapping("editLamp")
    public ModelAndView editLamp(@RequestParam long id, @ModelAttribute Lamp lamp) {
    	logger.info("Updating the Lamp for the Id "+id);
        lamp = lampService.getLamp(id);
        return new ModelAndView("lampForm", "lampObject", lamp);
    }
    
    @RequestMapping("editHardwareclient")
    public ModelAndView editHardwareclient(@RequestParam long id , @ModelAttribute Lamp lamp) {
    	logger.info("get the Hardwareclient data for the Id "+id);
    	lamp=lampService.getLamp(id);
    	logger.info("get the Hardwareclient data for the Id 2 "+lamp.getId());
    	logger.info("get the Hardwareclient data for the Id 3 "+lamp.toString());
  
    	

        return new ModelAndView("hardwareClient", "lampObject", lamp);
    }
    
    @RequestMapping("editServerclient")
    public ModelAndView editServerclient(@RequestParam long id , @ModelAttribute Lamp lamp) {
    	logger.info("get the Serverclient data for the Id "+id);
    	lamp=lampService.getLamp(id);
    	logger.info("get the Serverclient data for the Id 2 "+lamp.getId());
    	logger.info("get the Serverclient data for the Id 3 "+lamp.toString());

        return new ModelAndView("serverClient", "lampObject", lamp);
    }
    @RequestMapping("saveLamp")
    public ModelAndView saveLamp(@ModelAttribute Lamp lamp) {
    	logger.info("Saving the Lamp. Data : "+lamp);
        //controller 
        //disini akan digunakan untuk memanggil Korean Weather API 02022016 
        if(lamp.getId() == 0){ // if lamp_registration id is 0 
        	String lattemp = lamp.getLat();
	    	String lngtemp = lamp.getLng();
	    	String tempout = SpringRest.getWeatherCurrent(lattemp, lngtemp);
	    	String tempfl   = SpringRest.getPM10(lattemp, lngtemp);
	    	String humidity = tempout.split(",")[0];
	    	String temperature = tempout.split(",")[1];
	    	
	    	lamp.setHumidity(Float.parseFloat(humidity));
	    	lamp.setTemperature(Float.parseFloat(temperature));
	    	lamp.setDustconcentration(Float.parseFloat(tempfl));
	    	
	    	logger.info("controller pm info"+tempfl);
        	
            lampService.createLamp(lamp);

        } else {
        	//lamp = lampService.getLamp(id);
        	String lattemp     = lamp.getLat();
	    	String lngtemp     = lamp.getLng();
	    	String tempout     = lampRest.getWeatherCurrent(lattemp, lngtemp);
	    	String tempfl      = lampRest.getPM10(lattemp, lngtemp);
	    	String humidity    = tempout.split(",")[0];
	    	String temperature = tempout.split(",")[1];
	    	
	    	lamp.setHumidity(Float.parseFloat(humidity));
	    	lamp.setTemperature(Float.parseFloat(temperature));
	    	lamp.setDustconcentration(Float.parseFloat(tempfl));
	    	
	    	logger.info("controller pm info"+tempfl);
	    	
	    	
            lampService.updateLamp(lamp);
        }
        return new ModelAndView();
        
    }
    
    @RequestMapping("saveLampHardware")
    public ModelAndView saveLampHardware(@ModelAttribute Lamp lamp) {
    	logger.info("Saving the Lamp. Data : "+lamp);
    	logger.info("Saving the Lamp id : "+lamp.getId());
    	logger.info("Saving the Lamp voltage : "+lamp.getVoltage());
    		
            lampService.updateLamp(lamp);
           
            
   
        return new ModelAndView("saveLamp");
        
    }
    
    @RequestMapping("deleteLamp")
    public ModelAndView deleteLamp(@RequestParam long id) {
    	logger.info("Deleting the Lamp. Id : "+id);
        lampService.deleteLamp(id);
        return new ModelAndView("redirect:getAllLamps");
    }
    
    @RequestMapping(value = {"getAllLamps", "/lampmanagement"})
    public ModelAndView getAllLamps() {
    	logger.info("Getting the all Lamp.");
        List<Lamp> lampList = lampService.getAllLamps();
        //add by sid
        //lampRest.getWeatherCurrent();
        //WS.getWeather();
        
        return new ModelAndView("lampList", "lampList", lampList);
    }
    
    @RequestMapping("searchLamp")
    public ModelAndView searchLamp(@RequestParam("searchLedid") String searchLedid) {  
    	logger.info("Searching the Lamp. Lamp Led Id: "+searchLedid);
    	List<Lamp> lampList = lampService.getAllLamps(searchLedid);
        return new ModelAndView("lampList", "lampList", lampList);    	
    }
    
    //add by sid 15.03.2016 for hardware as a client form 
    @RequestMapping(value = {"hardwareClient", "/hardwareClient"})
    public ModelAndView hardwareClient(@ModelAttribute Lamp lamp) {
    	logger.info("Accessing Hardware as Client Form ");
        List<Lamp> lampList = null;
        //add by sid
        //lampRest.getWeatherCurrent();
        //WS.getWeather();
        
        return new ModelAndView("hardwareClient","hardwareClient",lampList);
    }
    //add by sid 17.03.2016 for hardware as a client form 
    @RequestMapping(value = {"serverClient", "/serverClient"})
    public ModelAndView serverClient(@ModelAttribute Lamp lamp) {
    	logger.info("Accessing server Client Form ");
        List<Lamp> lampList = null;
        //add by sid
        //lampRest.getWeatherCurrent();
        //WS.getWeather();
        
        return new ModelAndView("serverClient","serverClient",lampList);
    }
    
    //add by sid 13.04.2016 
    @RequestMapping(value = {"naverMap", "/naverMap"})
    public ModelAndView naverMap(@ModelAttribute Lamp lamp) {
    	logger.info("Accessing server Client Form ");
        List<Lamp> lampList = null;
        //add by sid
        //lampRest.getWeatherCurrent();
        //WS.getWeather();
        
        return new ModelAndView("naverMap","naverMap",lampList);
    }
}
package com.shiddiq.controller;
import java.util.List;
import com.shiddiq.entity.Lamp;
import com.shiddiq.service.LampService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;
 

 
@RestController
public class LampRestController {
 
    @Autowired
    LampService lampService;  //Service which will do all data retrieval/manipulation work
 
     
    //-------------------Retrieve All Lamps JSON--------------------------------------------------------
     
    @RequestMapping(value = "/getLamp", method = RequestMethod.GET)
    public ResponseEntity<List<Lamp>> listAllLamps()  {
        List<Lamp> lamps = lampService.getAllLamps();
        if(lamps.isEmpty()){
            return new ResponseEntity<List<Lamp>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Lamp>>(lamps, HttpStatus.OK);
    }

 //------------------- Update a User --------------------------------------------------------
     
    @RequestMapping(value = "/getLamp{id}/{temperature}/{humidity}", method = RequestMethod.PUT)
    public ResponseEntity<Lamp> updateUser(@PathVariable("id") long id,
        @PathVariable("temperature") float temperature,
        @PathVariable("humidity") float humidity,
     @RequestBody Lamp lamp) {
    	System.out.println("=========================");
        System.out.println("Updating Lamp id " + id);
        System.out.println("Updating Lamp temperature " + temperature);
        System.out.println("Updating Lamp humidity" + humidity);
         
        Lamp currentLamp = lampService.getLamp(id);
         
        if (currentLamp==null) {
            System.out.println("Lamp with id " + id + " not found");
            return new ResponseEntity<Lamp>(HttpStatus.NOT_FOUND);
        }
 
     
        currentLamp.setTemperature(temperature);
        currentLamp.setHumidity(humidity);
         
        lampService.updateLamp(currentLamp);
        return new ResponseEntity<Lamp>(currentLamp, HttpStatus.OK);
    }


 
}
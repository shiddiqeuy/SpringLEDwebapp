package com.shiddiq.service;
import com.shiddiq.entity.Lamp;
import java.util.List;

/**
 * @author shiddiq 
 * @version 2.0
 */
public interface LampService {
	public long createLamp(Lamp lamp);
    public Lamp updateLamp(Lamp lamp);
    public void deleteLamp(long id);
    public List<Lamp> getAllLamps();
    public Lamp getLamp(long id);	
	public List<Lamp> getAllLamps(String ledid);
}

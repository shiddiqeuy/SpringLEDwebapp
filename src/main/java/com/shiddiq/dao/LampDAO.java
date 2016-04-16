package com.shiddiq.dao;
import java.util.List;
import com.shiddiq.entity.Lamp;

/**
 * @author shiddiq 
 * @version 2.0
 */
public interface LampDAO {
    public long createLamp(Lamp lamp);
    public Lamp updateLamp(Lamp lamp);
    public void deleteLamp(long id);
    public List<Lamp> getAllLamps();
    public Lamp getLamp(long id);   
    public List<Lamp> getAllLamps(String ledid);
}

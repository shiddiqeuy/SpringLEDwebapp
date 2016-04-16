package com.shiddiq.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import java.io.Serializable;
/**
 * @author shiddiq 
 * @version 2.0
 * 
 */
@Entity
@Table(name = "lamps")
public class Lamp implements Serializable {
	
	private static final long serialVersionUID = -7988799579036225147L;

	@Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private long id;

    @Column
    private int ledid;

    @Column
    private int groupid;

    @Column
    private String location;

    @Column
    private String server_ip;
    
    @Column
    private String ledtype;

    @Column
    private String server_port;

    @Column
    private String logtime;

    @Column
    private String net;

     @Column
    private String status;

    @Column
    private String lat;

    @Column
    private String lng;
    
    @Column
    private int dimming;

    @Column
    private int voltage;

    @Column
    private int current;

    @Column
    private float temperature;

    @Column
    private float humidity;

    @Column
    private int report_cycle_time;
    
    @Column
    private int lampcondition;
    
    @Column
    private float dustconcentration;

    @Column
    private String lampcontrol;


    


    public Lamp() {
    }

    public long getId() {
        return id;
    }
    public void setId(long id) {
        this.id = id;
    }
  
    public int getLedid() {
        return ledid;
    }
    public void setLedid(int ledid) {
        this.ledid = ledid;
    }
    
    public String getLedtype() {
        return ledtype;
    }
    public void setLedtype(String ledtype) {
        this.ledtype = ledtype;
    }


    public int getGroupid() {
        return groupid;
    }
    public void setGroupid(int groupid) {
        this.groupid = groupid;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

     public String getServer_port() {
        return server_port;
    }

    public void setServer_port(String server_port) {
        this.server_port = server_port;
    }


    public String getServer_ip() {
        return server_ip;
    }
    public void setServer_ip(String server_ip) {
        this.server_ip = server_ip;
    }

    public String getLogtime() {
        return logtime;
    }
    public void setLogtime(String logtime) {
        this.logtime = logtime;
    }

    public String getNet() {
        return net;
    }
    public void setNet(String net) {
        this.net = net;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

     public String getLat() {
        return lat;
    }
    public void setLat(String lat) {
        this.lat = lat;
    }

     public String getLng() {
        return lng;
    }
    public void setLng(String lng) {
        this.lng = lng;
    }




    public int getDimming() {
        return dimming;
    }
    public void setDimming(int dimming) {
        this.dimming = dimming;
    }

    public int getVoltage() {
        return voltage;
    }
    public void setVoltage(int voltage) {
        this.voltage = voltage;
    }

     public int getCurrent() {
        return current;
    }
    public void setCurrent(int current) {
        this.current = current;
    }

    public float getTemperature() {
        return temperature;
    }
    public void setTemperature(float temperature) {
        this.temperature = temperature;
    }

    public float getHumidity() {
        return humidity;
    }
    public void setHumidity(float humidity) {
        this.humidity = humidity;
    }

   

    public int getReportcycletime() {
        return report_cycle_time;
    }
    public void setReportcycletime(int report_cycle_time) {
        this.report_cycle_time = report_cycle_time;
    }
    
    
    public int getLampcondition() {
        return lampcondition;
    }
    public void setLampcondition(int lampcondition) {
        this.lampcondition = lampcondition;
    }
    
    public float getDustconcentration() {
        return dustconcentration;
    }
    public void setDustconcentration(float dustconcentration) {
        this.dustconcentration = dustconcentration;
    }
    
    public String getLampcontrol() {
        return lampcontrol;
    }
    public void setLampcontrol(String lampcontrol) {
        this.lampcontrol = lampcontrol;
    }



    
    @Override
    public String toString() {
        return "Lamp{" +
                "id=" + id +
                ", ledid='" + ledid + '\'' +
                ", groupid=" + groupid +
                ", location=" + location +
                ", dimming=" + dimming +
                ", voltage=" + voltage +
                ", current=" + current +
                ", temperature=" + temperature +
                ", humidity=" + humidity +
                ", server_ip=" + server_ip +
                ", server_port=" + server_port +
                ", report_cycle_time=" + report_cycle_time +
                ", logtime=" + logtime +
                ", net=" + net +
                ", status=" + status +
                ", lat=" + lat +
                ", lng=" + lng +
                ", lampcondition=" + lampcondition +
                ", dustcondition=" + dustconcentration +
                ", ledtype=" + ledtype +
                ", lampcontrol=" + lampcontrol +
                '}';
    }
}
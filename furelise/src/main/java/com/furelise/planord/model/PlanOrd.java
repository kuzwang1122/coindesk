package com.furelise.planord.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.ManyToAny;

import lombok.Data;

//import com.furelise.city.model.City;
//import com.furelise.mem.model.Mem;
//import com.furelise.plan.model.Plan;
//import com.furelise.period.model.Period;
//import com.furelise.pickuptime.model.PickupTime;
//import com.furelise.pickupway.model.PickupWay;
//import com.furelise.planstatus.model.PlanStatus;

import java.io.Serializable;
import java.math.BigDecimal;
import java.sql.*;
import java.util.Objects;

@Entity
@Table(name = "planord")
@Data
public class PlanOrd implements Serializable{
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "planOrdID", updatable = false)
    private Integer planOrdID;
	
	@Column(name = "planID")
    private Integer planID;
//    @ManyToOne
//    @JoinColumn(name = "planID", referencedColumnName = "planID")
//    private Plan plan;

    @Column(name = "timeID")
    private Integer timeID;
//    @ManyToOne
//    @JoinColumn(name = "timeID", referencedColumnName = "timeID")
//    private PickupTime pickupTime;

    @Column(name = "periodID")
    private Integer periodID;
//    @ManyToOne
//    @JoinColumn(name = "periodID", referencedColumnName = "periodID")
//    private Period period;

    @Column(name = "`day`")
    private String day;
    
    @Column(name = "wayID")
    private Integer wayID;
//    @ManyToOne
//    @JoinColumn(name = "wayID", referencedColumnName = "wayID")
//    private PickupWay pickupWay;
    
    
    @Column(name = "memID")
    private Integer memID;
//    @ManyToOne
//    @JoinColumn(name = "memID", referencedColumnName = "memID")
//    private Mem mem;

    @Column(name = "planStart")
    private Date planStart;

    @Column(name = "planEnd")
    private Date planEnd;
    
    @Column(name = "cityCode")
    private String cityCode;
//    @ManyToOne
//    @JoinColumn(name = "cityCode", referencedColumnName = "cityCode")
//    private City city;

    @Column(name = "floor")
    private String floor;

    @Column(name = "pickupStop")
    private String pickupStop;

    @Column(name = "total")
    private BigDecimal total;

    @Column(name = "planOrdDate", updatable = false, insertable = false)
    private Timestamp planOrdDate;

    @Column(name = "amendLog")
    private Integer amendLog;

    @Column(name = "planStatusID")
    private Integer planStatusID;
//    @ManyToOne
//    @JoinColumn(name = "planStatusID", referencedColumnName = "planStatusID")
//    private PlanStatus planStatus;

    @Column(name = "contact")
    private String contact;

    @Column(name = "contactTel")
    private String contactTel;

    public PlanOrd() {
        super();
    }   
}
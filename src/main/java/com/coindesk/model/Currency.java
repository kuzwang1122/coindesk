package com.coindesk.model;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "CURRENCY")
public class Currency {

	@Id
    private String id;
    
    @Column(name = "name_zh_tw")
    private String nameZhTw;
    
    @Column(name = "create_time")
    private LocalDateTime createTime;
    
    @Column(name = "update_time")
    private LocalDateTime updateTime;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNameZhTw() {
		return nameZhTw;
	}

	public void setNameZhTw(String nameZhTw) {
		this.nameZhTw = nameZhTw;
	}

	public LocalDateTime getCreateTime() {
		return createTime;
	}

	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}

	public LocalDateTime getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(LocalDateTime updateTime) {
		this.updateTime = updateTime;
	}
	
}

package com.coindesk.model;

import java.util.Map;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CoinDeskResponse {
	
	private Time time;
    private String disclaimer;
    private String chartName;
    private Map<String, BpiInfo> bpi;
    
    @Data
    @NoArgsConstructor
    public static class Time {
        private String updated;
        
        @JsonProperty("updatedISO")
        private String updatedISO;
        
        @JsonProperty("updateduk")
        private String updatedUK;
    }
    
    @Data
    @NoArgsConstructor
    public static class BpiInfo {
        private String code;
        private String symbol;
        private String rate;
        
        @JsonProperty("rate_float")
        private Double rateFloat;
        
        private String description;
    }

}

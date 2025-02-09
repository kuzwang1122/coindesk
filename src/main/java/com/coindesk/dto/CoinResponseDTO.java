package com.coindesk.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CoinResponseDTO {
    
    // 要確保這個屬性存在
    @Setter
    @Getter
    private String updateTime;
    
    @Setter
    @Getter
    private List<CurrencyInfo> currencies;
    
    @Data
    @NoArgsConstructor
    @AllArgsConstructor
    public static class CurrencyInfo {
        private String code;
        private String nameTw;
        private String rate;
    }
}

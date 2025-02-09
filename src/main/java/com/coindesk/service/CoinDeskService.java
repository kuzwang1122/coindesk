package com.coindesk.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.coindesk.dto.CoinResponseDTO;
import com.coindesk.model.CoinDeskResponse;
import com.coindesk.model.Currency;
import java.util.List;
import java.util.ArrayList;

@Service
public class CoinDeskService {

	@Autowired
    private RestTemplate restTemplate;
    
    @Autowired
    private CurrencyService currencyService;
    
    private static final String COINDESK_API = "https://api.coindesk.com/v1/bpi/currentprice.json";

    public CoinDeskResponse getOriginalData() {
        return restTemplate.getForObject(COINDESK_API, CoinDeskResponse.class);
    }

    public CoinResponseDTO getTransformedData() {
        CoinDeskResponse originalData = getOriginalData();
        CoinResponseDTO response = new CoinResponseDTO();

        // Transform time format
        try {
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("MMM d, yyyy HH:mm:ss z");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            
            String updatedTime = originalData.getTime().getUpdated();
            LocalDateTime dateTime = LocalDateTime.parse(updatedTime, inputFormatter);
            response.setUpdateTime(dateTime.format(outputFormatter));
        } catch (Exception e) {
            // 如果日期解析失敗，使用當前時間
            response.setUpdateTime(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss")));
        }

        // Transform currency data
        List<CoinResponseDTO.CurrencyInfo> currencies = new ArrayList<>();
        originalData.getBpi().forEach((code, data) -> {
            try {
                Currency currency = currencyService.findById(code);
                currencies.add(new CoinResponseDTO.CurrencyInfo(
                    code,
                    currency.getNameZhTw(),
                    data.getRate()
                ));
            } catch (Exception e) {
                // 如果找不到對應的幣別資料，使用空字串作為中文名稱
                currencies.add(new CoinResponseDTO.CurrencyInfo(
                    code,
                    "",
                    data.getRate()
                ));
            }
        });
        response.setCurrencies(currencies);

        return response;
    }
}

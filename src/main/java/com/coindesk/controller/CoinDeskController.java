package com.coindesk.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coindesk.dto.CoinResponseDTO;
import com.coindesk.model.CoinDeskResponse;
import com.coindesk.service.CoinDeskService;

@RestController
@RequestMapping("/api/coindesk")
public class CoinDeskController {
	
	@Autowired
    private CoinDeskService coinDeskService;
    
    @GetMapping("/original")
    public CoinDeskResponse getOriginalData() {
        return coinDeskService.getOriginalData();
    }
    
    @GetMapping("/transform")
    public CoinResponseDTO getTransformedData() {
        return coinDeskService.getTransformedData();
    }

}

package com.coindesk.service;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coindesk.model.Currency;
import com.coindesk.repository.CurrencyRepository;

@Service
@Transactional
public class CurrencyService {
	
	@Autowired
    private CurrencyRepository currencyRepository;
    
    public List<Currency> findAll() {
        return currencyRepository.findAll();
    }
    
    public Currency findById(String id) {
        return currencyRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Currency not found"));
    }
    
    public Currency create(Currency currency) {
        currency.setCreateTime(LocalDateTime.now());
        currency.setUpdateTime(LocalDateTime.now());
        return currencyRepository.save(currency);
    }
    
    public Currency update(String id, Currency currency) {
        Currency existing = findById(id);
        existing.setNameZhTw(currency.getNameZhTw());
        existing.setUpdateTime(LocalDateTime.now());
        return currencyRepository.save(existing);
    }
    
    public void delete(String id) {
        currencyRepository.deleteById(id);
    }

}

package com.coindesk.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.coindesk.model.Currency;
import com.coindesk.service.CurrencyService;

@RestController
@RequestMapping("/api/currencies")
public class CurrencyController {

	@Autowired
    private CurrencyService currencyService;
    
    @GetMapping
    public List<Currency> getAll() {
        return currencyService.findAll();
    }
    
    @GetMapping("/{id}")
    public Currency getById(@PathVariable String id) {
        return currencyService.findById(id);
    }
    
    @PostMapping
    public Currency create(@RequestBody Currency currency) {
        return currencyService.create(currency);
    }
    
    @PutMapping("/{id}")
    public Currency update(@PathVariable String id, @RequestBody Currency currency) {
        return currencyService.update(id, currency);
    }
    
    @DeleteMapping("/{id}")
    public void delete(@PathVariable String id) {
        currencyService.delete(id);
    }
}

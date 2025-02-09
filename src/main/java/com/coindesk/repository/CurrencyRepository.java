package com.coindesk.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.coindesk.model.Currency;

public interface CurrencyRepository extends JpaRepository<Currency, String>{

}

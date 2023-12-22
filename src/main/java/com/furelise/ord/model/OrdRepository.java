package com.furelise.ord.model;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;


@Repository
public interface OrdRepository extends JpaRepository<Ord, Integer>{
	List<Ord> findByMemID(Integer memID);
}

package com.example.demo.repository;

import com.example.demo.domain.House;
import org.springframework.data.jpa.repository.JpaRepository;

public interface HouseRepo extends JpaRepository<House, Long> {

}

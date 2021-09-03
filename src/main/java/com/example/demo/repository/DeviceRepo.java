package com.example.demo.repository;

import com.example.demo.domain.Device;
import com.example.demo.domain.House;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeviceRepo extends JpaRepository<Device, Long> {
    Device findByHouse(House house);
    Device findByPower(Boolean power);
    Device findByVoltage(Integer voltage);
}

package com.example.demo.repository;

import com.example.demo.domain.Device;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DeviceRepo extends JpaRepository<Device, Long> {

}

package com.example.demo.service;

import com.example.demo.domain.Device;
import com.example.demo.domain.House;
import com.example.demo.repository.DeviceRepo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class DeviceService {
    private final DeviceRepo deviceRepo;

    public DeviceService(DeviceRepo deviceRepo) {
        this.deviceRepo = deviceRepo;
    }

    public List<Device> listAll() {
        return deviceRepo.findAll();
    }

    public void save(Device device) {
        deviceRepo.save(device);
    }
}

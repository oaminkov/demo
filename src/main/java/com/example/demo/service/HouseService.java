package com.example.demo.service;

import com.example.demo.domain.House;
import com.example.demo.repository.HouseRepo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class HouseService {
    private final HouseRepo houseRepo;

    public HouseService(HouseRepo houseRepo) {
        this.houseRepo = houseRepo;
    }

    public boolean isExists(String description) {
        if (houseRepo.findByDescription(description) == null) {
            return false;
        }
        return true;
    }

    public List<House> listAll() {
        return houseRepo.findAll();
    }

    public void save(House house) {
        houseRepo.save(house);
    }
}

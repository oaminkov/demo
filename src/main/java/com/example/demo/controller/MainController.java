package com.example.demo.controller;

import com.example.demo.domain.House;
import com.example.demo.service.DeviceService;
import com.example.demo.service.HouseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
public class MainController {
    private final HouseService houseService;
    private final DeviceService deviceService;

    public MainController(HouseService houseService, DeviceService deviceService) {
        this.houseService = houseService;
        this.deviceService = deviceService;
    }

    @GetMapping("houses")
    public String viewAllHouses(Model model) {
        List<House> houses = houseService.listAll();
        model.addAttribute("houses", houses);
        return "view_houses";
    }

    @PostMapping("houses/add")
    public String saveHouse(@ModelAttribute House house) {
        houseService.save(house);
        return "redirect:/houses";
    }
}

package com.example.demo.controller;

import com.example.demo.domain.Device;
import com.example.demo.domain.House;
import com.example.demo.service.DeviceService;
import com.example.demo.service.HouseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class MainController {
    private final HouseService houseService;
    private final DeviceService deviceService;

    public MainController(HouseService houseService, DeviceService deviceService) {
        this.houseService = houseService;
        this.deviceService = deviceService;
    }

    @GetMapping("/")
    public String redirectHousesPage(){
        return "redirect:/houses";
    }

    //HOUSES
    @GetMapping("houses")
    public String viewAllHouses(Model model) {
        List<House> houses = houseService.listAll();
        model.addAttribute("houses", houses);
        return "view_houses";
    }

    @GetMapping("houses/add")
    public String showNewHousePage() {
        return "add_house";
    }

    @PostMapping("houses/add")
    public String saveHouse(@RequestParam String description, Model model) {
        description = description.trim();

        if(!description.isEmpty()) {
            if(!houseService.isExists(description)) {
                House house = new House(description);
                houseService.save(house);
                return "redirect:/houses";
            }
            else {
                model.addAttribute("messageError", "Дом с таким описанием уже есть в базе");
            }
        }
        else {
            model.addAttribute("messageError", "Вы ввели пустую строку");
        }
        return "view_houses";
    }

    @GetMapping("houses/{id}")
    public String showViewHousePage(
            @PathVariable("id") House house,
            Model model
    ){
        model.addAttribute("house", house);
        return "view_house";
    }

    //DEVICES
    @GetMapping("devices")
    public String viewAllDevices(Model model) {
        List<Device> devices = deviceService.listAll();
        model.addAttribute("devices", devices);
        return "view_devices";
    }

    @GetMapping("devices/add")
    public String showNewDevicePage(Model model) {
        List<House> houses = houseService.listAll();
        model.addAttribute("houses", houses);

        return "add_device";
    }

    @PostMapping("devices/add")
    public String saveDevice(
            @RequestParam(defaultValue = "0") Boolean power,
            @RequestParam(required = false) Integer voltage,
            @RequestParam(required = false) House house
    ) {
        if (voltage != null) {
            voltage = modifyVoltage(voltage);
        }

        Device device = new Device(power, voltage);
        device.setHouse(house);

        deviceService.save(device);

        return "redirect:/devices";
    }

    @GetMapping("devices/{id}")
    public String showViewDevicePage(
            @PathVariable("id") Device device,
            Model model
    ){
        model.addAttribute("device", device);

        List<House> houses = houseService.listAll();
        model.addAttribute("houses", houses);

        return "view_device";
    }

    @PostMapping("devices/edit/{id}")
    public String editDevice(
            @PathVariable("id") Device device,
            @RequestParam(defaultValue = "0") Boolean power,
            @RequestParam(required = false) Integer voltage,
            @RequestParam(required = false) House house) {

        if (voltage != null) {
            voltage = modifyVoltage(voltage);

            device.setVoltage(voltage);
        }

        device.setPower(power);
        device.setHouse(house);
        deviceService.save(device);

        return String.format("redirect:/devices/%d", device.getId());
    }

    public Integer modifyVoltage(Integer voltage) {
        voltage = voltage - (voltage % 5);
        voltage = (voltage > 220) ? 220 : voltage;
        voltage = (voltage < 5) ? 5 : voltage;

        return voltage;
    }
}

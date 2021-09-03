package com.example.demo.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;

@Getter
@Setter
@NoArgsConstructor

@Entity
@Table(name = "device")
public class Device {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "device_generator")
    @SequenceGenerator(name="device_generator", sequenceName = "device_seq", allocationSize=50)
    private Long id;

    @Column(nullable = false)
    private Boolean power;

    private Integer voltage;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn (name = "id_house")
    private House house;

    public Device(Boolean power) {
        this.power = power;
    }

    public Device(Boolean power, Integer voltage) {
        this.power = power;
        this.voltage = voltage;
    }

    @Override
    public String toString() {
        return "Device{" +
                "id=" + id +
                ", power=" + power +
                ", voltage=" + voltage +
                ", house=" + house +
                '}';
    }
}

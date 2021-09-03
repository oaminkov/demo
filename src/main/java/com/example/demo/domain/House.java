package com.example.demo.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.persistence.*;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor

@Entity
@Table(name = "house")
public class House {
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "house_generator")
    @SequenceGenerator(name="house_generator", sequenceName = "house_seq", allocationSize=10)
    private Long id;

    @Column(nullable = false, unique = true)
    private String description;

    @OneToMany(mappedBy = "house", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Device> devices;

    public House(String description) {
        this.description = description;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", description='" + description + '\'' +
                '}';
    }
}

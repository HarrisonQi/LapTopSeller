package data.mapper;

import data.entity.Laptop;

import java.util.List;

public interface LaptopMapper {
    List<Laptop> getAll();

    int add(Laptop laptop);

    int delByName(String name);
}

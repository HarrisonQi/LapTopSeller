package data.service;

import data.entity.Laptop;

import java.util.List;

public interface ILaptopService {
    List<Laptop> getAll();
    int add(Laptop laptop);
    int delByName(String name);
}

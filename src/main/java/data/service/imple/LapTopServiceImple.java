package data.service.imple;

import data.entity.Laptop;
import data.mapper.LaptopMapper;
import data.service.ILaptopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class LapTopServiceImple implements ILaptopService {

    @Autowired
    private LaptopMapper laptopMapper;

    public List<Laptop> getAll() {
        return laptopMapper.getAll();
    }
}

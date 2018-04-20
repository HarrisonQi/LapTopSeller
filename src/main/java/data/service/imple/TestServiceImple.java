package data.service.imple;

import data.entity.Test;
import data.mapper.TestMapper;
import data.service.ITestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TestServiceImple implements ITestService {

    @Autowired
    private TestMapper testMapper;

    public List<Test> testList() {
        return testMapper.getAll();
    }
}

package data.mapper;

import data.entity.Test;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TestMapper {
    List<Test> getAll();
}

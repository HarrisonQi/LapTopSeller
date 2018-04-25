package data.mapper;

import data.entity.Order;

import java.util.List;
import java.util.Map;

public interface OrderMapper {
    List<Map<String, Object>> getAllRelation();
    int add(Order order);
}

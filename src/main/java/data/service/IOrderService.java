package data.service;

import data.entity.Order;

import java.util.List;
import java.util.Map;

public interface IOrderService {
    List<Map<String, Object>> getAllRelation();

    int addOrder(Order order);
}

package data.service.imple;

import data.entity.Order;
import data.mapper.OrderMapper;
import data.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderServiceImple implements IOrderService {
    @Autowired
    private OrderMapper orderMapper;

    public List<Map<String, Object>> getAllRelation() {
        return orderMapper.getAllRelation();
    }

    public int addOrder(Order order) {
        return orderMapper.add(order);
    }
}

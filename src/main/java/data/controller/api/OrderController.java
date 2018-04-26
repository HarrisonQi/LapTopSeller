package data.controller.api;

import data.common.Response;
import data.entity.Laptop;
import data.entity.Order;
import data.entity.User;
import data.service.IOrderService;
import data.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    private IOrderService orderService;

    @Autowired
    private IUserService userService;

    @RequestMapping("/getAllRelation")
    @ResponseBody
    public Response getAllRelation(){
        List<Map<String, Object>> listMap = orderService.getAllRelation();
        if(listMap==null){
            return Response.error("无笔记本信息!");
        }
        //System.out.println(orders);
        //System.out.println(orders.toString());

        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        //sdf.format("1524703745000");
        for(Map<String, Object> map :listMap){
            map.put("time",sdf.format( map.get("time")));
        }

        //System.out.println(listMap);
        //System.out.println(listMap.get(0).get("time").getClass());
        //System.out.println("getAllRelation");

        return Response.success("查询成功", listMap);
    }

    //username: ${user.username},
    //laptop_id: $('#laptop_id').val(),
    //user_id: ${user.id},
    //mount:$('#mount').val()

    @ResponseBody
    @RequestMapping(value = "/addOrder")
    public Response addOrder(@RequestParam(value = "username") String username,
                            @RequestParam(value = "laptop_id") String laptop_id,
                            @RequestParam(value = "user_id") String user_id,
                            @RequestParam(value = "mount") String mount){
        Order order = new Order();
        order.setLaptop_id(Integer.parseInt(laptop_id));
        order.setMount(Integer.parseInt(mount));
        order.setUser_id(Integer.parseInt(user_id));

        User user = userService.getUserByName(username);

        //if(userService.getUserByName(username)!=null){
        //    return Response.error("500","重复人员!");
        //}
        int addNum = orderService.addOrder(order);
        if(addNum>0){
            System.out.println("添加成功");
            return Response.success("添加成功", user);

        }

        return Response.error("添加失败, 请联系技术人员!");
    }

}

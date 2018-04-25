package data.controller.api;

import data.common.Response;
import data.entity.Laptop;
import data.service.ILaptopService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/laptop")
public class LaptopController {

    @Autowired
    private ILaptopService laptopService;

    @RequestMapping("/getAll")
    @ResponseBody
    public Response getAll(){
        List<Laptop> laptops = laptopService.getAll();
        if(laptops==null){
            return Response.error("无笔记本信息!");
        }
        System.out.println(laptops);
        return Response.success("查询成功", laptops);
    }

    @RequestMapping("/add")
    @ResponseBody
    public Response add(@RequestParam(value = "name") String name,
                        @RequestParam(value = "price") String price,
                        @RequestParam(value = "producer") String producer,
                        @RequestParam(value = "brand") String brand,
                        @RequestParam(value = "model") String model,
                        @RequestParam(value = "tag") String tag){
        System.out.println(name+","+price+","+producer+","+brand+","+model+","+tag);
        Laptop laptop = new Laptop();
        laptop.setBrand(brand);
        laptop.setModel(model);
        laptop.setName(name);
        laptop.setPrice(price);
        laptop.setProducer(producer);
        laptop.setTag(tag);
        if(laptopService.add(laptop)>0){
            return Response.success("添加成功", laptop);
        }

        return Response.error("添加失败, 请联系技术人员!");
    }
}

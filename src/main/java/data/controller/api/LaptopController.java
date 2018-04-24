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
}

package data.controller.api;

import data.common.Response;
import data.entity.User;
import data.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    @RequestMapping("/getAllUser")
    public Response getAllUser(){
        List<User> users = userService.getAllUser();
        return Response.success("查询成功", users);
    }
}

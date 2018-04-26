package data.controller.api;

import com.google.gson.Gson;
import data.common.Response;
import data.entity.Laptop;
import data.entity.User;
import data.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.bind.SchemaOutputResolver;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    IUserService userService;

    @ResponseBody
    @RequestMapping(value = "/getAllUser")
    public Response getAllUser(){
        List<User> users = userService.getAllUser();
        System.out.println("getAllUser");
        if(users==null){
            return Response.error("查询失败, 请联系技术人员");
        }
        return  Response.success("查询成功", users);
    }

    @ResponseBody
    @RequestMapping(value = "/updateUser")
    public Response updateUser(@RequestParam(value = "username") String username,
                        @RequestParam(value = "level") String level){
        //if(){
        //
        //}
        if(userService.getUserByName(username)==null){
            return Response.error("无此人员!");
        }

        User user = new User();
        user.setUsername(username);
        user.setLevel(level);
        if(userService.updateUser(user)>0){
            return Response.success("添加成功", user);
        }

        return Response.error("添加失败, 请联系技术人员!");
    }


    @ResponseBody
    @RequestMapping(value = "/addUser")
    public Response addUser(@RequestParam(value = "username") String username,
                               @RequestParam(value = "level") String level,
                            @RequestParam(value = "password") String password,
                            @RequestParam(value = "mobile") String mobile){
        User user = new User();
        user.setUsername(username);
        user.setLevel(level);
        user.setPassword(password);
        user.setMobile(mobile);
        if(userService.getUserByName(username)!=null){
            return Response.error("500","重复人员!");
        }
        if(userService.addUser(user)>0){
            return Response.success("添加成功", user);
        }

        return Response.error("添加失败, 请联系技术人员!");
    }

    @RequestMapping("/changePwd")
    @ResponseBody
    public Response changePwd(@RequestParam(value = "username") String username,
                            @RequestParam(value = "password") String password,
                            @RequestParam(value = "mobile") String mobile){
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setMobile(mobile);

        if(userService.changePwd(user)>0){
            return Response.success("修改成功", userService.getUserByName(username));
        }

        return Response.error("添加失败, 请联系技术人员!");
    }

    @RequestMapping("/del")
    @ResponseBody
    public Response delUserByUsername(@RequestParam(value = "username") String username){
        User user = new User();
        user.setUsername(username);
        //user.setPassword(password);
        //user.setMobile(mobile);
        if(userService.getUserByName(username)==null){
            return Response.error("无此人员!");
        }

        if(userService.delUserByName(username)>0){
            return Response.success("删除成功");
        }

        return Response.error("删除失败, 请联系技术人员!");
    }



}

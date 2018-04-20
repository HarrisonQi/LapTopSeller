package data.controller.api;

import data.common.Response;
import data.entity.User;
import data.util.StringUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/api")
public class LoginController {
    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    @ResponseBody
    public Response login(@RequestParam(value = "username")String username, @RequestParam(value = "password") String password){
        System.out.println("username:"+username+",pwd:"+password);

        if (StringUtil.isBlank(username)) {
            return Response.error("用户名为空！");
        }

        if (StringUtil.isBlank(password)) {
            return Response.error("密码为空！");
        }
        User user = new User();
        user.setUsername("admin");
        user.setPassword("123");
        user.setLevel("1");
        user.setMobile("110");

        if (user == null) {
            return Response.error("用户名不存在！");
        }
        if (!StringUtil.equals(password, user.getPassword())) {
            return Response.error("用户名密码错误！");
        }
        System.out.println("");

        return Response.success("登陆成功",user);
    }

}

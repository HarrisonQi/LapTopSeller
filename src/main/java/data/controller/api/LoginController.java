package data.controller.api;

import data.common.Response;
import data.entity.User;
import data.service.IUserService;
import data.util.StringUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


@Controller
@RequestMapping("/api")
public class LoginController {


    @Resource
    HttpServletRequest request;

    @Autowired
    private IUserService userService;


    @RequestMapping(value = "/login", method = {RequestMethod.POST})
    @ResponseBody
    public Response login(@RequestParam(value = "username") String username, @RequestParam(value = "password") String password, HttpSession session) {
        System.out.println("username:" + username + ",pwd:" + password);

        if (StringUtil.isBlank(username)) {
            return Response.error("用户名为空！");
        }

        if (StringUtil.isBlank(password)) {
            return Response.error("密码为空！");
        }
        User user = userService.getUserByName(username);
        System.out.println(user);
        if (user == null) {
            System.out.println("用户名不存在");
            return Response.error("用户名不存在！");
        }
        if (!StringUtil.equals(password, user.getPassword())) {
            return Response.error("用户名密码错误！");
        }
        System.out.println("");
        //在Session里保存信息
        session.setAttribute("username", username);

        return Response.success("登陆成功", user);
    }


    @RequestMapping("/logout")
    public Response logout(HttpSession session) {
        //清除Session
        session.invalidate();
        return Response.success("退出成功");
    }

}

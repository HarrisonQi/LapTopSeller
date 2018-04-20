package data.controller;

import data.entity.User;
import data.service.ITestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class MainController {


    @RequestMapping("/index")
    public String index(@RequestParam(required = false)String username, Model model){
        User user = new User();
        user.setUsername("admin");
        user.setPassword("123");
        user.setLevel("1");
        user.setMobile("110");
        model.addAttribute("user",user);
        return "index";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }



}

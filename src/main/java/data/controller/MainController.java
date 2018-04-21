package data.controller;

import data.entity.User;
import data.service.ITestService;
import data.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/main")
public class MainController {

    @Autowired
    private IUserService userService;


    @RequestMapping("/index")
    public String index(@RequestParam(required = false)String username, Model model){
        User user = userService.getUserByName(username);
        model.addAttribute("user",user);
        return "index";
    }

    @RequestMapping("/login")
    public String login(){
        return "login";
    }

    @RequestMapping("/securitySettings")
    public String securitySettings(@RequestParam(required = false)String username, Model model){
        User user = userService.getUserByName(username);
        model.addAttribute("user",user);
        return "securitySetting";
    }


}

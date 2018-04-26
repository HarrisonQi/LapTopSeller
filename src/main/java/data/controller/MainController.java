package data.controller;

import data.entity.User;
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
    public String index(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "index";
    }

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/securitySettings")
    public String securitySettings(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "SecuritySetting";
    }

    @RequestMapping("/authorityControl")
    public String authorityControl(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "AuthorityControl";
    }

    @RequestMapping("/commodityControl")
    public String commodityControl(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "CommodityControl";
    }

    @RequestMapping("/userControl")
    public String userControl(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "UserControl";
    }

    @RequestMapping("/orderControl")
    public String orderControl(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "OrderControl";
    }

    @RequestMapping("/uploadCommodity")
    public String uploadCommodity(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "UploadCommodity";
    }

    @RequestMapping("/updateUserLevel")
    public String updateUserLevel(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "UpdateUserLevel";
    }

    @RequestMapping("/addUser")
    public  String addUser(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "AddUser";
    }

    @RequestMapping("/addOrder")
    public  String addOrder(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "AddOrder";
    }
    @RequestMapping("/delLaptop")
    public  String delLaptop(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "DelLaptop";
    }
    @RequestMapping("/delUser")
    public  String delUser(@RequestParam(required = false) String username, Model model) {
        User user = userService.getUserByName(username);
        model.addAttribute("user", user);
        return "DelUser";
    }

}

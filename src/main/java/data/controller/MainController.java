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

}

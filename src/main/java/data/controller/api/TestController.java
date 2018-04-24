package data.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class TestController {
    //@Autowired
    //private ITestService testService ;

    @RequestMapping("/test")
    public String test(){
        //System.out.println("List:"+testService.testList());
        return "test";
    }
}

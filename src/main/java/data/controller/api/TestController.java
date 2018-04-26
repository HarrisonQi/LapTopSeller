package data.controller.api;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.text.DateFormat;
import java.text.SimpleDateFormat;

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

    public static void main(String[] args) {
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        sdf.format("1524703745000");
        System.out.println();
    }
}

package cn.smbms.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
@Controller
public class KingController {
    @RequestMapping(value="/sys/king/king.html")
    public String main(){
        return "king";
    }
}

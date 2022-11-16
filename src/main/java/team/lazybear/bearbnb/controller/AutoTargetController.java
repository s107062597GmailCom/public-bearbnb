package team.lazybear.bearbnb.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/autotarget")
public class AutoTargetController {

    @GetMapping
    public String goAutoTargetPage() {
        return "pages/autoschedule/autotarget";
    }

}

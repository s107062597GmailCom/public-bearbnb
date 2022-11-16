package team.lazybear.bearbnb.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.data.IndexRoomSummary;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.service.WishService;

@Controller
@RequestMapping("/wish")
@SessionAttributes(names = { "myaccount" })
public class WishController {

    @Autowired
    private WishService wishService;

    @GetMapping("/check.do")
    @ResponseBody
    public String isWished(@RequestParam String uuid, Model model) {
        Account myaccount = (Account)model.getAttribute("myaccount");
        if (myaccount == null) return "false";

        return wishService.isWished(myaccount, uuid) ? "true" : "false";
    }

    @GetMapping("/add.do")
    @ResponseBody
    public String addWish(@RequestParam String uuid, Model model) {
        Account myaccount = (Account)model.getAttribute("myaccount");
        if (myaccount == null) return "false";

        return wishService.addWish(myaccount, uuid) == 0 ? "true" : "false";
    }

    @GetMapping("/delete.do")
    @ResponseBody
    public String deleteWish(@RequestParam String uuid, Model model) {
        Account myaccount = (Account)model.getAttribute("myaccount");
        if (myaccount == null) return "false";
        return wishService.deleteWish(myaccount, uuid) == 0 ? "true" : "false";
    }

    @GetMapping("/all.do")
    @ResponseBody
    public List< IndexRoomSummary > getWishes(Model model) {
        Account myaccount = (Account)model.getAttribute("myaccount");
        if (myaccount == null) return null;
        return wishService.getWishes(myaccount);
    }

    @GetMapping("/clearall.do")
    @ResponseBody
    public String clearAll(Model model) {
        Account myaccount = (Account)model.getAttribute("myaccount");
        if (myaccount == null) return "false";
        return wishService.clearAll(myaccount);
    }

}

package team.lazybear.bearbnb.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import team.lazybear.bearbnb.config.GLobalConfig;
import team.lazybear.bearbnb.data.IndexRoomPage;
import team.lazybear.bearbnb.data.TimePeriod;
import team.lazybear.bearbnb.model.Account;
import team.lazybear.bearbnb.model.City;
import team.lazybear.bearbnb.service.AccountService;
import team.lazybear.bearbnb.service.CityService;
import team.lazybear.bearbnb.service.RoomSearchService;

@Controller
@SessionAttributes(names = { "myaccount" })
public class IndexController {

    private SimpleDateFormat simpleDateFormat;

    @Autowired
    private AccountService accountService;

    @Autowired
    private CityService cityService;

    @Autowired
    private RoomSearchService roomSearchService;

    public IndexController() {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    }

    @GetMapping("/isSignIn.do")
    @ResponseBody
    public String isSignIn(Model model) {
        Account myAccount = (Account)model.getAttribute("myaccount");
        if (myAccount == null) return "false";

        Long id = myAccount.getId();
        if (id == null) return "false";

        Account account = accountService.findById(id);
        if (account == null) return "false";

        String username = account.getUsername();
        if (username == null || !username.equals(myAccount.getUsername()))
            return "false";

        String password = account.getPassword();
        if (password == null || !password.equals(myAccount.getPassword()))
            return "false";

        return "true";
    }

    @GetMapping("/cities")
    @ResponseBody
    public List< City > findAllCity() {
        return cityService.findAll();
    }

    @GetMapping("/summaries")
    @ResponseBody
    public IndexRoomPage getSummaries(
            @RequestParam Map< String, String > args) {
//        IndexRoomPage ds = roomSearchService.defaultSearch(Integer.parseInt(args.get("p")));

        String catcher = args.get("p");
        Integer pageNumber = catcher == null ?
                1 : Integer.parseInt(catcher);

        catcher = args.get("n");
        Integer roomPerPage = catcher == null ?
                GLobalConfig.Homepage.HOMEPAGE_ROOM_COUNT :
                Integer.parseInt(catcher);

        catcher = args.get("city");
        Integer cityId = catcher == null ?
                0 : Integer.parseInt(catcher);

        catcher = args.get("address");
        String[] keys = catcher == null ?
                null : catcher.split(" ");

        catcher = args.get("adult-number");
        Integer adultNumber = catcher == null ?
                null : Integer.parseInt(catcher);

        catcher = args.get("child-number");
        Integer childNumber = catcher == null ?
                null : Integer.parseInt(catcher);

        catcher = args.get("check-in-date");
        Date checkInDate = getDate(catcher);

        catcher = args.get("check-out-date");
        Date checkOutDate = getDate(catcher);

        if (checkInDate == null && checkOutDate != null)
            checkOutDate = null;
        if (checkInDate != null && checkOutDate == null)
            checkOutDate =
                new Date(checkInDate.getTime() + TimePeriod.DAY);

        IndexRoomPage page = roomSearchService.search(pageNumber, roomPerPage,
                cityId, keys, adultNumber, childNumber, checkInDate,
                checkOutDate);

        return page;
    }

    private Date getDate(String dateString) {
        Date date = null;
        try { date = simpleDateFormat.parse(dateString + " 09:00:00"); }
        catch (Exception e) {}
        return date;
    }

}

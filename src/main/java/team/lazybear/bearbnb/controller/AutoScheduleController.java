package team.lazybear.bearbnb.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import team.lazybear.bearbnb.config.GLobalConfig;
import team.lazybear.bearbnb.data.IndexRoomSummary;
import team.lazybear.bearbnb.service.RoomSearchService;

@Controller
@RequestMapping( "/autoschedule" )
public class AutoScheduleController {

    private SimpleDateFormat simpleDateFormat;

    @Autowired
    private RoomSearchService roomSearchService;

    public AutoScheduleController() {
        simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    }

    @GetMapping
    public String goAutoSchedulePage() {
        return "pages/autoschedule/autoschedule";
    }

    @GetMapping("/summaries")
    @ResponseBody
    public IndexRoomSummary[] getSummaries(@RequestParam Map< String, String > args) {
        String catcher = args.get("startDate");
        Date startDate = getDate(catcher);
        if (startDate == null)
            return null;

        catcher = args.get("endDate");
        Date endDate = getDate(catcher);
        if (endDate == null)
            return null;

        catcher = args.get("number");
        Integer number = Integer.parseInt(catcher);
        if (number < 0) return null;

        IndexRoomSummary[] summaries =
                roomSearchService.search(startDate, endDate, number);

        return summaries;
    }

    @GetMapping("/distancematrix")
    @ResponseBody
    public String getDistanceMatrix(
            @RequestParam String args, @RequestParam String travelMode) {
        String coordinates = args.replace("x", "%7C");

        String json = null;

        CloseableHttpClient httpClient = HttpClients.createDefault();

        String url = "https://maps.googleapis.com/maps/api/distancematrix"
                + "/json?key=" + GLobalConfig.Google.GoogleMapKey
                + "&origins=" + coordinates + "&destinations=" + coordinates
                + "&mode=" + travelMode;

        try {
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            json = EntityUtils.toString(entity);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return json;
    }

    @GetMapping("/fulldistancematrix")
    @ResponseBody
    public String getFullDistanceMatrix(
            @RequestParam String argsx,
            @RequestParam String argsy,
            @RequestParam String travelMode) {
        String coordinatesX = argsx.replace("x", "%7C");
        String coordinatesY = argsy.replace("x", "%7C");

        String json = null;

        CloseableHttpClient httpClient = HttpClients.createDefault();

        String url = "https://maps.googleapis.com/maps/api/distancematrix"
                + "/json?key=" + GLobalConfig.Google.GoogleMapKey
                + "&origins=" + coordinatesX + "&destinations=" + coordinatesY
                + "&mode=" + travelMode;

        try {
            HttpGet httpGet = new HttpGet(url);
            CloseableHttpResponse response = httpClient.execute(httpGet);
            HttpEntity entity = response.getEntity();
            json = EntityUtils.toString(entity);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return json;
    }

    private Date getDate(String dateString) {
        Date date = null;
        try { date = simpleDateFormat.parse(dateString + " 09:00:00"); }
        catch (Exception e) {}
        return date;
    }

}

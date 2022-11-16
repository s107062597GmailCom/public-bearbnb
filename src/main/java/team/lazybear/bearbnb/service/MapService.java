package team.lazybear.bearbnb.service;

import java.io.IOException;

import org.apache.http.HttpEntity;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import team.lazybear.bearbnb.config.GLobalConfig;
import team.lazybear.bearbnb.model.Room;

@Service
public class MapService {
	public static Room getRoomPositionByAddress(Room room) throws ClientProtocolException, IOException {
		CloseableHttpClient httpclient = HttpClients.createDefault();
			String url = "https://maps.google.com/maps/api/geocode/json?";
			String address = "address=" + room.getAddress();
			String urlkey = "key="+GLobalConfig.Google.GoogleMapKey;
			HttpGet httpget = new HttpGet(url + address + "&" + urlkey);

			CloseableHttpResponse response = httpclient.execute(httpget);
		
				HttpEntity entity = response.getEntity();
				System.out.println(response.getStatusLine());
				if (entity != null) {
					String entityStr = EntityUtils.toString(entity);
					JSONObject o = new JSONObject(entityStr);
					System.out.println(o.toString());
					JSONArray result = (JSONArray)o.get("results");
					JSONObject jsonObject = (JSONObject)result.get(0);
					System.out.println(jsonObject);
					JSONObject geometry = (JSONObject) jsonObject.get("geometry");
					JSONObject locate = (JSONObject) geometry.get("location");
					String lat = locate.get("lat").toString();
					String lng = locate.get("lng").toString();
					double lat_Double = Double.parseDouble(lat);
					double lng_Double = Double.parseDouble(lng);
					room.getInformation().setLatitude(lat_Double);
					room.getInformation().setLongitude(lng_Double);
					response.close();
					return room;
				}	
		response.close();
		return null;
	}

	private static double rad(double d) {
		return d * Math.PI / 180.00; // 角度轉換成弧度
	}

	public static int calDistance(String loate1, String loate2) {
		double lat1 = Double.parseDouble(loate1.split(",")[0]);
		double lng1 = Double.parseDouble(loate1.split(",")[1]);
		double lat2 = Double.parseDouble(loate2.split(",")[0]);
		double lng2 = Double.parseDouble(loate2.split(",")[1]);

		double a = lat1 - lat2;// 兩點緯度之差
		double b = rad(lng1) - rad(lng2); // 經度之差
		double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2) + Math.cos(lat1) 
		* Math.cos(lat2) * Math.pow(Math.sin(b / 2), 2)));// 計算兩點距離的公式
		s = s * 6378137.0;// 弧長乘地球半徑（半徑為米）
		s = Math.round(s * 10000d) / 10000d;// 精確距離的數值
		s = s / 1000;// 將單位轉換為km，如果想得到以米為單位的資料 就不用除以1000
						// 四捨五入 保留一位小數
		
		return (int)s;
	}
}

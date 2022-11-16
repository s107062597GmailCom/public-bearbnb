package team.lazybear.bearbnb.defense;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ReadListener;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.lang3.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.safety.Whitelist;

/*
 	實現XSS過濾
 	如果想要对参数进行修改就需要重新定义 HttpServletRequestWrapper，
 	只有用自定义的HttpServletRequestWrapper 才能对参数进行修改。
 	
 */
public class XssHttpServletRequestWrapper extends HttpServletRequestWrapper {

	private HttpServletRequest orgRequest = null;
	/**
	 * 配置可以通过过滤的白名单 / private static final Whitelist whitelist = new Whitelist();
	 * /** 配置过滤化参数,不对代码进行格式化
	 */

	private static final Whitelist whitelist = new Whitelist();
	private static final Document.OutputSettings outputSettings = new Document.OutputSettings().prettyPrint(false);

	public XssHttpServletRequestWrapper(HttpServletRequest request) {
		super(request);
		// 抓取原始的request 生成物件
		orgRequest = request;

	}

	// 當後端取得request之後 已經是XssHttpServletRequestWrapper了！
	// 因此以下要調用request的方法時候都會經過我們overrirde的方法 而不是原生request方法

	// 專門處理 POST请求，或者 RequestBody。

	@Override
	public ServletInputStream getInputStream() throws IOException {

		BufferedReader br = new BufferedReader(new InputStreamReader(orgRequest.getInputStream()));
		String line = br.readLine();
		String result = "";

		// 把流讀成String 並進行清理
		if (line != null) {
			result += clean(line);
		}

		return new WrappedServletInputStream(new ByteArrayInputStream(result.getBytes()));
	}

	/**
	 * 覆盖getParameter方法，将参数名和参数值都做xss过滤。<br/>
	 * 如果需要获得原始的值，则通过super.getParameterValues(name)来获取<br/>
	 * getParameterNames,getParameterValues和getParameterMap也可能需要覆盖
	 */
	@Override
	public String getParameter(String name) {
		// 1.過濾 『物件的名稱』 看有沒有藏怪東西
		// 如果沒有符合條件 就要進行清理
		if (("content".equals(name) || name.endsWith("WithHtml"))) {
			return super.getParameter(name);
		}
		name = clean(name);

		// 2.過濾『物件內容』 看有沒有藏怪東西
		String value = super.getParameter(name);
		// StringUtils方法 查看字串是 whitespace, empty ("") or null 三種情形
		// 如果單純使用String的isBlank解析null物件 會出現nullpointer錯誤
		if (StringUtils.isNotBlank(value)) {
			value = clean(value);
		}
		return value;
	}

	@Override
	public Map getParameterMap() {
		Map map = super.getParameterMap();
		// 返回值Map
		Map<String, String> returnMap = new HashMap<String, String>();
		Iterator entries = map.entrySet().iterator();
		Map.Entry entry;
		String name = "";
		String value = "";
		while (entries.hasNext()) {
			entry = (Map.Entry) entries.next();
			name = (String) entry.getKey();
			Object valueObj = entry.getValue();
			if (null == valueObj) {
				value = "";
			} else if (valueObj instanceof String[]) {
				String[] values = (String[]) valueObj;
				for (int i = 0; i < values.length; i++) {
					value = values[i] + ",";
				}
				value = value.substring(0, value.length() - 1);
			} else {
				value = valueObj.toString();
			}
			returnMap.put(name, clean(value).trim());
		}
		return returnMap;
	}

	@Override
	public String[] getParameterValues(String name) {
		String[] arr = super.getParameterValues(name);
		if (arr != null) {
			for (int i = 0; i < arr.length; i++) {
				arr[i] = clean(arr[i]);
			}
		}
		return arr;
	}

	/**
	 * 覆盖getHeader方法，将参数名和参数值都做xss过滤。<br/>
	 * 如果需要获得原始的值，则通过super.getHeaders(name)来获取<br/>
	 * getHeaderNames 也可能需要覆盖
	 */
	@Override
	public String getHeader(String name) {

		name = clean(name);
		String value = super.getHeader(name);
		if (StringUtils.isNotBlank(value)) {
			value = clean(value);
		}
		return value;
	}

	/**
	 * 获取最原始的request
	 *
	 * @return
	 */
	public HttpServletRequest getOrgRequest() {
		return orgRequest;
	}

	/**
	 * 获取最原始的request的静态方法
	 *
	 * @return
	 */
	public static HttpServletRequest getOrgRequest(HttpServletRequest req) {
		if (req instanceof XssHttpServletRequestWrapper) {
			return ((XssHttpServletRequestWrapper) req).getOrgRequest();
		}

		return req;
	}

	// 清理方法
	// 使用Jsoup的方法進行清理
	public String clean(String content) {
		String result = Jsoup.clean(content, "", whitelist.basic(), outputSettings);
		return result;
	}

	private class WrappedServletInputStream extends ServletInputStream {

		private InputStream stream;

		public void setStream(InputStream stream) {
			this.stream = stream;
		}

		public WrappedServletInputStream(InputStream stream) {
			this.stream = stream;
		}

		@Override
		public int read() throws IOException {
			return stream.read();
		}

		@Override
		public boolean isFinished() {
			return true;
		}

		@Override
		public boolean isReady() {
			return true;
		}

		@Override
		public void setReadListener(ReadListener readListener) {

		}
	}

}

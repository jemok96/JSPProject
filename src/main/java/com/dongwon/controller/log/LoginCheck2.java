package com.dongwon.controller.log;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

@WebServlet("/login/checkNaver")
public class LoginCheck2 extends HttpServlet {
	private static HttpURLConnection connect(String apiUrl) {
		try {
			URL url = new URL(apiUrl);
			return (HttpURLConnection) url.openConnection();
		} catch (MalformedURLException e) {
			throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
		} catch (IOException e) {
			throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
		}
	}

	private static String readBody(InputStream body) {
		InputStreamReader streamReader = new InputStreamReader(body);

		try (BufferedReader lineReader = new BufferedReader(streamReader)) {
			StringBuilder responseBody = new StringBuilder();

			String line;
			while ((line = lineReader.readLine()) != null) {
				responseBody.append(line);
			}

			return responseBody.toString();
		} catch (IOException e) {
			throw new RuntimeException("API 응답을 읽는데 실패했습니다.", e);
		}
	}

	private static String get(String apiUrl, Map<String, String> requestHeaders) {
		HttpURLConnection con = connect(apiUrl);
		try {
			con.setRequestMethod("GET");
			for (Map.Entry<String, String> header : requestHeaders.entrySet()) {
				con.setRequestProperty(header.getKey(), header.getValue());
			}

			int responseCode = con.getResponseCode();
			if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
				return readBody(con.getInputStream());
			} else { // 에러 발생
				return readBody(con.getErrorStream());
			}
		} catch (IOException e) {
			throw new RuntimeException("API 요청과 응답 실패", e);
		} finally {
			con.disconnect();
		}
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String nickname ="";
		String name="";
		String email="";
		String mobile="";
		String birthday="";
		String birthyear ="";
		
		String clientId = "cyLayBKUvNpVzIYWagMY";// 애플리케이션 클라이언트 아이디값";
		String clientSecret = "_l582ebBXZ";// 애플리케이션 클라이언트 시크릿값";
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String redirectURI = URLEncoder.encode("http://localhost:8080/login/checkNaver", "UTF-8");
		String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code" + "&client_id=" + clientId
				+ "&client_secret=" + clientSecret + "&redirect_uri=" + redirectURI + "&code=" + code + "&state="
				+ state;
		String access_token = "";
		String refresh_token = "";
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int responseCode = con.getResponseCode();
			BufferedReader br;
			System.out.println("responseCode=" + responseCode);
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuilder res = new StringBuilder();
			while ((inputLine = br.readLine()) != null) {
				res.append(inputLine);
			}
			br.close();
			if (responseCode == 200) {
		
				JSONParser parsing = new JSONParser();
				Object obj = parsing.parse(res.toString());
				JSONObject jsonObj = (JSONObject) obj;
				access_token = (String) jsonObj.get("access_token");
				refresh_token = (String) jsonObj.get("refresh_token");
				
//				access_token이 null이 아닐경우 사용자 정보 받아오는 부분
//				JSON으로 파싱, 처리
				if (access_token != null) {
					try {
						String token = access_token; // 네이버 로그인 접근 토큰;
						String header = "Bearer " + token; // Bearer 다음에 공백 추가

						String apiURL2 = "https://openapi.naver.com/v1/nid/me";

						Map<String, String> requestHeaders = new HashMap<>();
						requestHeaders.put("Authorization", header);
						String responseBody = get(apiURL2, requestHeaders);

//						System.out.println(responseBody);
						JSONParser jsonParser = new JSONParser();
						JSONObject jsonObject = (JSONObject)jsonParser.parse(responseBody);
//						System.out.println(jsonObject);
						JSONObject resObj = (JSONObject)jsonObject.get("response");
//						System.out.println(resObj);
						nickname = (String)resObj.get("nickname");
						name = (String)resObj.get("name");
						email = (String)resObj.get("email");
						mobile =(String)resObj.get("mobile");
						birthday =(String)resObj.get("birthday");
						birthyear =(String)resObj.get("birthyear");
					} catch (Exception e) {

					}
				}
				
			}
		} catch (Exception e) {
			// Exception 로깅
		}
		System.out.println("nickname = "+nickname);
		System.out.println("name = "+name);
		System.out.println("email = "+email);
		System.out.println("mobile = "+mobile);
		System.out.println("birth = "+birthyear+"-"+birthday);
		
		response.sendRedirect("/index");
	}
}
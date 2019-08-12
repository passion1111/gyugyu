<!-- 
네이버 로그인 접근토큰 획득 예제는 2개의 프로그램으로 구성되어 있습니다. (naverlogin.jsp, callback.jsp)
1. naverlogin.jsp
-->
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
    String clientId = "fRezVk5_Htz8SWJjSj7d";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost:8080/USA/view/mem/naver.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
  <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
  </body>
</html>
<!-- 
2. callback.jsp
 -->
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>네이버로그인</title>
  </head>
  <body>
  <%
  	String str = null;
  
    //String clientId = "fRezVk5_Htz8SWJjSj7d";//애플리케이션 클라이언트 아이디값";
    String clientSecret = "2tckaN8GEV";//애플리케이션 클라이언트 시크릿값";
    String code = request.getParameter("code");
    //String state = request.getParameter("state");
    //String redirectURI = URLEncoder.encode("http://localhost:8080/USA/view/mem/naver.jsp", "UTF-8");
   // String apiURL;
    apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code&";
    apiURL += "client_id=" + clientId;
    apiURL += "&client_secret=" + clientSecret;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&code=" + code;
    apiURL += "&state=" + state;
    String access_token = "";
    String refresh_token = "";
    //System.out.println("apiURL="+apiURL);
    try {
      URL url = new URL(apiURL);
      HttpURLConnection con = (HttpURLConnection)url.openConnection();
      con.setRequestMethod("GET");
      int responseCode = con.getResponseCode();
      BufferedReader br;
      System.out.print("responseCode="+responseCode);
      if(responseCode==200) { // 정상 호출
        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
      } else {  // 에러 발생
        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
      }
      String inputLine;
      StringBuffer res = new StringBuffer();
      while ((inputLine = br.readLine()) != null) {
        res.append(inputLine);
      }
      str = res.toString();
      br.close();
      if(responseCode==200) {
        out.println(res.toString());
      }
    } catch (Exception e) {
      System.out.println(e);
    }
    
   
    JSONParser parser = new JSONParser();
    JSONObject json = (JSONObject)parser.parse(str);
    
     String token = (String)json.get("access_token");// 네이버 로그인 접근 토큰; 여기에 복사한 토큰값을 넣어줍니다.
     String header = "Bearer " + token; // Bearer 다음에 공백 추가
     try {
         String apiURL2 = "https://openapi.naver.com/v1/nid/me";
         URL url = new URL(apiURL2);
         HttpURLConnection con = (HttpURLConnection)url.openConnection();
         con.setRequestMethod("GET");
         con.setRequestProperty("Authorization", header);
         int responseCode = con.getResponseCode();
         BufferedReader br;
         if(responseCode==200) { // 정상 호출
             br = new BufferedReader(new InputStreamReader(con.getInputStream()));
         } else {  // 에러 발생
             br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
         }
         String inputLine;
         StringBuffer response2 = new StringBuffer();
         while ((inputLine = br.readLine()) != null) {
             response2.append(inputLine);           
         }
         br.close();
         
         JSONObject json2 = (JSONObject)parser.parse(response2.toString());
         JSONObject info = (JSONObject)json2.get("response");
         String id = (String)info.get("id");
         String email = (String)info.get("email");
         String profile_image = (String)info.get("profile_image");
         String name = (String)info.get("name");
         System.out.println("==============================");
         System.out.println("id : " + id);
         System.out.println("email : " + email);
         System.out.println("profile_image : " + profile_image);
         System.out.println("name : " + name);
         System.out.println("==============================");
         
         System.out.println(response2.toString());
     } catch (Exception e2) {
         System.out.println(e2);
     }
    
    
    
    
    
  %>
  </body>
</html>
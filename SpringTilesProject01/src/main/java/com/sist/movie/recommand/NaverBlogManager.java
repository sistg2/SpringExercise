package com.sist.movie.recommand;
import java.io.*;
import java.net.*;


//jZBX9wIAItqjLToMaEW7
//u3kpjNUCKr
public class NaverBlogManager {
	public static void main(String[] args) {
		NaverBlogManager nbm = new NaverBlogManager();
		nbm.recommandNamverData("추운날");
	}
	public void recommandNamverData(String ss) 
	//public static void main(String[] args)
	{
		String clientId = "jZBX9wIAItqjLToMaEW7";//애플리케이션 클라이언트 아이디값";
		String clientSecret = "u3kpjNUCKr";//애플리케이션 클라이언트 시크릿값";
		try {
			String text = URLEncoder.encode(ss+" 영화 추천", "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text; // json 결과
			//String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
			} else {  // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();	
			System.out.println(response.toString());
			File dir = new File("c:\\naver_data");
			if(!dir.exists()) {
				dir.mkdir();
			}
			FileWriter fw = new FileWriter("c:\\naver_data\\movie.json"); // 경로와 파일명 옆에 true 붙이면 : append
			fw.write(response.toString());
			fw.close();
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}
}

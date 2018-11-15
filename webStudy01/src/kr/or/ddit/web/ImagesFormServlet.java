package kr.or.ddit.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ImagesFormServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ServletContext context=req.getServletContext();
		String contentFolder= context.getInitParameter("contentFolder");
		File folder = (File)context.getAttribute("contentFolder");
		String[] filenames=folder.list(new FilenameFilter() {
			
			@Override
			public boolean accept(File dir, String name) {
				String mime =context.getMimeType(name);
				if(mime!=null) {
					
					return mime.startsWith("image/");
				}
				return false;
			}
		});
		//form의 method=get
		StringBuffer sb= new StringBuffer();
		resp.setContentType("text/html;charset=UTF-8");
		
		InputStream in= this.getClass().getResourceAsStream("imgform.html");//char
		InputStreamReader isr= new InputStreamReader(in,"UTF-8");//cahr
		BufferedReader br = new BufferedReader(isr);//효율성을 위한 버퍼
		StringBuffer html= new StringBuffer();
		String temp=null;
		while((temp=br.readLine())!=null){
			html.append(temp+"\n");
		}
		String pattern="<option>%s</option>\n";
		for (int i = 0; i < filenames.length; i++) {
			sb.append(String.format(pattern, filenames[i]));
		}
		int start= html.indexOf("@img");
		int end =start + "@img".length();
		String replace= sb.toString();
		html.replace(start,end,replace);
		
		PrintWriter out=resp.getWriter();//출력해주기위한 타입
		out.println(html.toString());
//		out.close();
		
		
	}

}

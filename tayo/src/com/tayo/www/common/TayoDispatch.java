package com.tayo.www.common;

import java.io.*;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("*.do")
public class TayoDispatch extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	HashMap map = new HashMap();
		
    public TayoDispatch() {
        super();
    }

    @Override
    public void init()throws ServletException{
  
    	Properties prop = new Properties();
    	String fileName = this.getClass().getResource("/com/tayo/www/common/TayoRequestMap.prop").getPath();
    	FileInputStream fin = null;
    	try{
    	 	fin = new FileInputStream(fileName);
    		prop.load(fin);
    	}
    	catch(Exception e){
    		System.out.println("prop 파일 읽기 오류:"+e);
    	}
    	finally{
    		try{
    			fin.close();
    		}
    		catch(Exception e){
    			System.out.println("prop 파일 닫기 오류:"+e);
    		}
    	}
	
       	Set set = prop.keySet(); 
    	Iterator iter = set.iterator();	
    	while(iter.hasNext()){ 
    		String key = (String)iter.next(); 
    		String className = prop.getProperty(key);
//    		System.out.println("등록 클래스:"+className);
    		try{
    			Class cl = Class.forName(className);
    			Object obj = cl .newInstance();
    			map.put(key, obj);
    		}
    		catch(Exception e){
    			System.out.println("초기화 오류:"+e);
    		}
    	}
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}		
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		service(request,response);
	}

	public void service (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String full = request.getRequestURI().toString();
		String domain = request.getContextPath();
		int pos = full.indexOf(domain);
		int len = domain.length();
		String real = full.substring(pos+len);
		System.out.println("request URL: "+real);
		String view = "";
		if(map.containsKey(real)){
			
			Object obj = map.get(real);
			TayoMain main = (TayoMain)obj;
			view = main.Exe(request, response);
			System.out.println("response URL:: "+view);
			
		}
		else{

			String temp = full.substring(0, pos+ domain.length());
			response.sendRedirect(temp);
			return;
		}
		
		//view 호출
		RequestDispatcher di = request.getRequestDispatcher(view);
		di.forward(request, response);
	}
}


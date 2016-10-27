package com.tayo.www.admin.bicycle;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tayo.www.common.TayoMain;
import com.tayo.www.data.BicycleData;
import com.tayo.www.sql.AdminDAO;
import com.tayo.www.sql.MemberDAO;
import com.tayo.www.util.PageInfo;

public class AdminBicycleStateList implements TayoMain {
	public String Exe(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{

		String strPage = req.getParameter("nowPage");
		int nowPage = 0;

		if(strPage == null){
			nowPage = 1;
		}
		else{
			nowPage = Integer.parseInt(strPage);
		}
		//자전거 상태별 보기
		String strSort = req.getParameter("sort");
		int sort = 0;
		if(strSort==null){
			sort = 0;
		}
		else if(nowPage > 1){
			sort = Integer.parseInt(strSort);
		}
		else{
			sort = Integer.parseInt(strSort);
			nowPage = 1;
		}
		
		//저장된 start, end 페이지 
		AdminDAO dao = new AdminDAO();
		ResultSet rs = dao.getColRow();
		int col = 0;
		int row = 0;
		try {
			rs.next();
			col = rs.getInt("srow");
			row = rs.getInt("scol");
		} catch (Exception e) {}
		
		
		int total = dao.getTotalBicycleInfo(sort);
		
		System.out.println(col);
		System.out.println(row);
		System.out.println(total);
		
		PageInfo pinfo = new PageInfo(nowPage, total,col,row);
		int start = (pinfo.getNowPage() - 1) * pinfo.getPageList() + 1;
		int end = start + pinfo.getPageList() - 1;
		rs = dao.getList(start, end , sort);
		ArrayList list = new ArrayList();
		String temp = "";
		try {
			while(rs.next()){

				BicycleData data = new BicycleData();
				data.setBno(rs.getString("BYNO"));
				data.setBlocation(rs.getString("JIJEOM"));
				data.setId(rs.getString("id"));
				data.setEtime(rs.getString("ReTIME"));
				data.setStime(rs.getString("rstime"));
				data.setRday(rs.getString("rday"));
				if(rs.getString("BSTATUS").equals("1")){
					temp = "대기중";
				}
				else if(rs.getString("BSTATUS").equals("2")){
					temp = "대여중";
				}
				else if(rs.getString("BSTATUS").equals("3")){
					temp = "연체중";
				}
				else if(rs.getString("BSTATUS").equals("4")){
					temp = "파손";
				}
				else if(rs.getString("BSTATUS").equals("5")){
					temp = "분실";
				}
				data.setBstaus(temp);
				list.add(data);
			}
		} catch (Exception e) {}
		dao.close();
		//페이지나눔 정보도 나중에 추가

		req.setAttribute("SORT", sort);
		req.setAttribute("LIST", list);
		req.setAttribute("PINFO", pinfo);
		req.setAttribute("NOWPAGE", nowPage);

		return "../admin/bicycle/AdminBicycleStateList.jsp";
	}
}

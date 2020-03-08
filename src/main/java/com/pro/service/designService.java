package com.pro.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.Design;
import com.pro.dao.Member;
import com.pro.dao.MemberDAO;

@Service
public class designService {
	@Autowired private MemberDAO dao;

	public int design(Design design,String userid) {
		return dao.design(design,userid);
	}
	
	public Design getstyle(String userid) {
		Member member=null;
		member=dao.getstyle(userid);
		if(member == null) {
			return null;
		} else {
			if(member.getStyle().equals("0") || "0".equals(member.getStyle())) {
				return null;
			} else {
				String oldstyle=member.getStyle();
				String[] newstyle=oldstyle.split(":");
				Design design=new Design();
				design.setLayout(newstyle[0]);
				/*
				 * for(int i=1;i<=20;i++) { System.out.println(i+":"+newstyle[i]); }
				 */
				
				design.setShow1box(newstyle[1]);
				design.setShow2box(newstyle[2]);
				design.setShow3box(newstyle[3]);
				design.setShow4box(newstyle[4]);
				
				design.setShow1font(newstyle[5]);
				design.setShow2font(newstyle[6]);
				design.setShow3font(newstyle[7]);
				design.setShow4font(newstyle[8]);
				
				design.setShow1style(newstyle[9]);
				design.setShow2style(newstyle[10]);
				design.setShow3style(newstyle[11]);
				design.setShow4style(newstyle[12]);
				
				design.setShow1size(newstyle[13]);
				design.setShow2size(newstyle[14]);
				design.setShow3size(newstyle[15]);
				design.setShow4size(newstyle[16]);
				
				design.setShow1align(newstyle[17]);
				design.setShow2align(newstyle[18]);
				design.setShow3align(newstyle[19]);
				design.setShow4align(newstyle[20]);
				
				return design;
		}
		}
	}

}

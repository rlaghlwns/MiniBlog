package com.pro.service;

import org.springframework.stereotype.Service;

@Service
public class UpdateService {
	public String updateForm(String writerdata, String contextdata, String textarea) {

		// Board꺼
		// profile 사진 등록하면 매개변수 하나 더 받아야함
		// 댓글 폼
		if (contextdata == null || contextdata.equals("null")) {
			String str = "<tr>" + "            " + "" + "<th style=\"text-align: left;\">"
					+ "											<div style=\"display: inline-block;\">"
					+ "												<img class=\"img\" width=\"30px;\""
					+ "													src=\"LoadImg?usernickname=" + writerdata
					+ "\">" + "											</div>&nbsp;"
					+ "											<div style=\"display: inline-block;\" class=\"writerinfo\">"
					+ "												<strong>" + writerdata + "</strong>"
					+ "											</div>" + "										</th>"
					+ "" + "" + "" + "         </tr>" + "         <tr>" + "            <td colspan=\"2\">"
					+ "               <textarea id=\"rcontext\" " + "name=" + textarea
					+ " rows=\"5\" placeholder=\"댓글을 입력하세요.\">" + "</textarea>" + "            </td>" + "         </tr>"
					+ "         <tr>" + "            <td colspan=\"2\" align=\"right\">"
					+ "            <input class=\"inputbtn\" type=\"button\" value=\"취소\" onclick=\"location.reload()\">"
					+ "            <input class=\"inputbtn\" type=\"submit\" value=\"등록\">" + "            </td>      "
					+ "         </tr>";

			return str;
		}

		// 수정 폼
		else {
			String str = "<tr>" + "            <th>" + "" + "<th style=\"text-align: left;\">"
					+ "											<div style=\"display: inline-block;\">"
					+ "												<img class=\"img\" width=\"30px;\""
					+ "													src=\"LoadImg?usernickname=" + writerdata
					+ "\">" + "											</div>&nbsp;"
					+ "											<div style=\"display: inline-block;\" class=\"writerinfo\">"
					+ "												<strong>" + writerdata + "</strong>&nbsp; "
					+ "											</div>" + "										</th>"
					+ "" + "" + "</th>" + "         </tr>" + "         <tr>" + "            <td colspan=\"2\">"
					+ "               <textarea id=\"rcontext\" " + "name= " + textarea + " rows=\"5\" >" + contextdata
					+ "</textarea>" + "            </td>" + "         </tr>" + "         <tr>"
					+ "            <td colspan=\"2\" align=\"right\">"
					+ "            <input class=\"inputbtn\" type=\"button\" value=\"취소\" onclick=\"location.reload()\">"
					+ "            <input class=\"inputbtn\" type=\"submit\" value=\"수정완료\">"
					+ "            </td>      " + "         </tr>";
			return str;
		}
	}

	// QNA
	public String updateForm(String writerdata, String contextdata, String textarea, String title) {
		if (title == null || title.equals("null")) {
			String str = "<style>#d,e,f{display:none;}</style> " + "<tr>" + "            <td colspan=\"2\">"
					+ "               <textarea style=\"width:705px;resize:none;\" id=\"rcontext\" " + "name= "
					+ textarea + " rows=\"5\" >" + contextdata + "</textarea>" + "            </td>" + "         </tr>"
					+ "         <tr>" + "            <td colspan=\"2\" align=\"right\">"
					+ "            <input type=\"button\" id=\"d\" class=\"btn\" value=\"취소\"onclick=\"location.reload()\">"
					+ "            <input type=\"submit\" id=\"e\" class=\"btn\" value=\"수정완료\">"
					+ "            </td>      " + "         </tr>";
			return str;

		} else {
			String str = "<style>#a,b,c{display:none;}</style> " + "<tr>" + "            <th>제목</th>"
					+ "<td><input style=\"width:100%;height:50px;\" type=\"text\" name=\"qtitle\" value=\" " + title
					+ "\"></td>" + "<th>" + writerdata + "         </tr>" + "         <tr>"
					+ "            <td colspan=\"3\">"
					+ "               <textarea style=\"width:100%;height:200px;resize:none; \" id=\"rcontext\" "
					+ "name= " + textarea + " rows=\"5\" >" + contextdata + "</textarea>" + "            </td>"
					+ "         </tr>" + "         <tr>" + "            <td colspan=\"3\" align=\"right\">"
					+ "            <input type=\"button\"  class=\"btn\" value=\"취소\" onclick=\"location.reload()\">"
					+ "            <input type=\"submit\" class=\"btn\"  value=\"수정완료\">" + "            </td>      "
					+ "         </tr>";
			return str;
		}
	}
}

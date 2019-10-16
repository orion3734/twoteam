<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="w3-main w3-content w3-padding"
	style="max-width: 1600px;">
	<div class="wow fadeInDown">
		<p id="top">Best Top3</p>
	</div>
	<div class="wow fadeInDown" id="topform">
		<table id="top_frm">
			<tr>
				<c:forEach items="${sessionScope.iuList}" var="aList">
					<td><img src="/twoteam/khtemp/${aList.tb_img}"
						class="top_img"><br /> <a href="travle.do"
						class="top_img_title"> ${aList.tb_title}</a></td>
				</c:forEach>
			</tr>

		</table>
	</div>
</div>



<%
	session.removeAttribute("iuList");
%>
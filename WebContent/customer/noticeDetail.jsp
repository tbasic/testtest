<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   request.setCharacterEncoding("utf-8");
%>
<%
String seq=request.getParameter("c");
//select * from notices where seq=2

String sql="select * from notices where seq="+seq;
//db connect
//드라이버로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="hr";
String pw="123456";
Connection con=DriverManager.getConnection(url, user, pw);
//실행
Statement st=con.createStatement();

//결과
ResultSet rs=st.executeQuery(sql);//select 실행
rs.next();


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/nstyle.css" />

</head>
<body>
<h3>noticeDetail.jsp</h3>
<table class="twidth">
   <colgroup>
      <col width="15%" />
      <col width="35%" />
      <col width="15%" />
      <col width="35%" />   
   </colgroup>
   <caption>Detail</caption>
   <tbody>
      <tr>
         <th class="left">글번호</th>
         <td><%=rs.getString("seq") %></td>
         <th class="left">조회수</th>
         <td><%=rs.getString("hit") %></td>   
      </tr>
      <tr>
         <th class="left">작성자</th>
         <td><%=rs.getString("writer") %></td>
         <th class="left">작성시간</th>
         <td><%=rs.getDate("regdate") %></td>   
      </tr>
      <tr>
         <th class="left">제목</th>
         <td colspan="3">
         <%=rs.getString("title") %>
         </td>
      </tr>
      <tr>
         <th class="left">내용</th>
         <td colspan="3" id="content">
         <%=rs.getString("content") %>
         </td>
      </tr>
      <tr>
         <th class="left">첨부</th>
         <td colspan="3" id="addfile">
         첨부
         </td>
      </tr>
   </tbody>
</table>
<div>
<a href="noticeEdit.jsp?c=<%=rs.getString("seq") %>">수정</a>
<a href="noticeDelProc.jsp?c=<%=rs.getString("seq") %>">삭제</a>
<a href="notice.jsp">목록</a>

</div>
</body>
</html>

<%
rs.close();
st.close();
con.close();
%>
<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>�˳��ɹ�</title>
  </head>
  
  <body>
    <% 
      if(session.getAttribute("uid")!=null||session.getAttribute("aid")!=null)
         session.removeAttribute("uid");
         session.removeAttribute("aid");
    %>
    <div>
      <h1>�˳��ɹ�����ѡ����Ӧ������</h1><br /><br/>
      <table>
        <tr>
	      <td><a href="Index.html"><img class="small" src="pics/index.ico" alt="��ҳ" />��ҳ</a></td>
	    </tr>
        <tr>
	      <td><a href="Login.html"><img class="small" src="pics/login.ico" alt="��¼" />��¼</a></td>
	    </tr>
	    <tr>
	      <td><a href="Register.html"><img class="small" src="pics/register.ico" alt="ע��" />ע��</a></td>
	    </tr>
      </table>
    </div>
  </body>
</html>

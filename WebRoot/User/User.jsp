<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>�û�����</title>
  </head>
  <body>
    <div class="right-top">
                    �û��˺ţ�
      <% String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ�����û�ҳ��</h1><br /><br/>
      <h2>���ã�<% out.println(uid);%>�û������ѵ�¼�ɹ�����ѡ����Ӧ������
      </h2><br/><br/>
      <table>
        <tr>
          <td>
            <a href="../Logout.jsp"><img class="small" src="../pics/logout.ico" alt="�˳�ϵͳ" />�˳�ϵͳ</a>
          </td>
          <td>
            <a href="Changepass.jsp"><img class="small" src="../pics/changepass.ico" alt="�޸�����" />�޸�����</a>
          </td>
          <td>
            <a href="UserInfo.jsp"><img class="small" src="../pics/userinfo.ico" alt="������Ϣ" />������Ϣ</a>
          </td>
        </tr>
        <tr>
          <td>
            <a href="Newsp_u.jsp"><img class="small" src="../pics/newsp.ico" alt="�鿴����" />�鿴����</a>
          </td>
          <td>
            <a href="Bookinfo_u.jsp"><img class="small" src="../pics/booking.ico" alt="������Ϣ" />������Ϣ</a>
          </td>
          <td></td>
        </tr>
      </table>
    </div>
  </body>
</html>
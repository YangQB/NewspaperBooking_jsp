<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>����Ա����</title>
  </head>
  
  <body>
    <div class="right-top">
                     ����Ա�˺ţ�
      <% String aid=(String)session.getAttribute("aid");
         out.println(aid);
         if(aid==null)
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
    <div class="text">
      <h1>�������Ĺ���ϵͳ��������Աҳ��</h1><br /><br/>
      <h2>���ã�<% out.println(aid);%>����Ա�����ѵ�¼�ɹ�����ѡ����Ӧ������
      </h2>
    </div>
    <table>
        <tr>
          <td>
            <a href="../Logout.jsp"><img class="small" src="../pics/logout.ico" alt="�˳�ϵͳ" />�˳�ϵͳ</a>
          </td>
          <td>
            <a href="Changepass_a.jsp"><img class="small" src="../pics/changepass.ico" alt="�޸�����" />�޸�����</a>
          </td>
          <td>
            <a href="Getuser.jsp"><img class="small" src="../pics/getuser.ico" alt="�û���Ϣ" />�û���Ϣ</a>
          </td>
          <td>
            <a href="Bookinfo_a.jsp"><img class="small" src="../pics/booking.ico" alt="������Ϣ" />������Ϣ</a> 
          </td>
        </tr>
        <tr>
          <td>
            <a href="Newsp_a.jsp"><img class="small" src="../pics/newsp.ico" alt="�鿴����" />�鿴����</a>
          </td>
          <td>
            <a href="Addnewsp.jsp"><img class="small" src="../pics/addnewsp.ico" alt="��ӱ���" />��ӱ���</a>
          </td>
          <td>
            <a href="Statistics.jsp"><img class="small" src="../pics/getuser.ico" alt="ͳ����Ϣ" />ͳ����Ϣ</a>
          </td>
          <td></td>
        </tr>
      </table>
  </body>
</html>
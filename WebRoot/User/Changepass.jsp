<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>�޸�����</title>
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
                        alert("�޸�����ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ�����޸�����</h1><br /><br/>
      <form name="myform_3" method="post" onsubmit="return checkinput(this);" action="Changepass_2.jsp">
        <table>
          <tr>
            <td>�û��˺ţ�</td>
            <td><% out.println(uid); %></td>
          </tr>
          <tr>
            <td>������ԭ���룺</td>
            <td><input type="password" name="pass_1" /></td>
          </tr>
          <tr>
            <td>�����������룺</td>
            <td><input type="password" name="pass_2" /></td>
          </tr>
          <tr>
            <td>��ȷ�������룺</td>
            <td><input type="password" name="pass_3" /></td>
          </tr>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="ȷ��" /></td>
          </tr>
          </table>
        </form>
        <script type="text/javascript"> 
	      function checkinput(myform_3)
          {
             if(myform_3.pass_1.value=="")
             {
               alert("��������������!");
               return false;
             }
             if(myform_3.pass_2.value==""||myform_3.pass_3.value=="")
             {
               alert("�����벻��Ϊ��!");
               return false;
             }
             if(myform_3.pass_2.value != myform_3.pass_3.value)
             {
               alert("�������������벻һ�£�����������!");
               return false;
             }
          }
     </script>
     <table>
        <tr>
          <td>
            <a href="User.jsp"><img class="small" src="../pics/user.ico" alt="�û�����" />�û�����</a>
          </td>
        </tr>
      </table>   
    </div>
  </body>
</html>
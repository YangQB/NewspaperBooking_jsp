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
                    ����Ա�˺ţ�
      <% String aid=(String)session.getAttribute("aid");
         out.println(aid);
         if(aid==null)
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
      <form name="myform_5" method="post" onsubmit="return checkinput(this);" action="Changepass_a_2.jsp">
        <table>
          <tr>
            <td>����Ա�˺ţ�</td>
            <td><% out.println(aid); %></td>
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
	      function checkinput(myform_5)
          {
             if(myform_5.pass_1.value=="")
             {
               alert("��������������!");
               return false;
             }
             if(myform_5.pass_2.value==""||myform_3.pass_3.value=="")
             {
               alert("�����벻��Ϊ��!");
               return false;
             }
             if(myform_5.pass_2.value != myform_3.pass_3.value)
             {
               alert("�������������벻һ�£�����������!");
               return false;
             }
          }
     </script>
     <table>
        <tr>
          <td>
            <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="����Աҳ��" />����Աҳ��</a>
          </td>
        </tr>
      </table>   
    </div>
  </body>
</html>
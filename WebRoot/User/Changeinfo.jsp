<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>�޸ĸ�����Ϣ</title>
  </head>
  
  <body>
      <div class="right-top">
                               �û��˺ţ� <%
         String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("�޸�ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
        %>  
      </div>
      <div>
        <h1>�������Ĺ���ϵͳ�����޸ĸ�����Ϣ</h1><br />
        <h3>�±��У������޸ĵ���Ϣ�������롣</h3>
        <form name="myform_2" method="post"  action="Changeinfo_2.jsp">
          <table>
            <tr>
              <td>�û�������</td>
              <td><input type="text" name="uname" maxlength="20"/></td>
            </tr>
            <tr>
              <td>���֤�ţ�</td>
              <td><input type="text" name="uidnum" maxlength="18"/></td>
            </tr>
            <tr>
              <td>�û��绰��</td>
              <td><input type="text" name="uphone" maxlength="12"/></td>
            </tr>
            <tr>
              <td>�û���ַ��</td>
              <td><input type="text" name="uad" maxlength="30"/></td>
            </tr>
            <tr>
              <td>���ڲ��ţ�</td>
              <td><select name="did" >
                    <option value="KF001">����һ�� </option>                 
                    <option value="KF002">�������� </option>
                    <option value="KF003">�������� </option>
                    <option value="KF004">�����Ĳ� </option>
                    <option value="KF005">�����岿 </option>  
                    <option value="KF006">�������� </option>                 
                    <option value="XQ101">����һ�� </option>
                    <option value="XQ102">������� </option>
                    <option value="XQ103">�������� </option>
                    <option value="SJ201">���һ�� </option> 
                    <option value="SJ202">��ƶ��� </option>                 
                    <option value="SJ203">������� </option>
                    <option value="SJ204">����Ĳ� </option>
                    <option value="CS301">����һ�� </option>
                    <option value="CS302">���Զ��� </option>
                    <option value="CS303">�������� </option>
                    <option value="CS304">�����Ĳ� </option>
                    <option value="BG401">�汾����һ�� </option>
                    <option value="BG402">�汾������� </option>
                    <option value="YW501">��άһ�� </option> 
                    <option value="YW502">��ά���� </option>
                    <option value="YW503">��ά���� </option>
                    <option value="YW504">��ά�Ĳ� </option>
                    <option value="YW505">��ά�岿 </option>
                    <option value="YW506">��ά���� </option>           
                  </select>
              </td>
            </tr>
            <tr>
              <td></td>
              <td><input type="submit" value="ȷ���޸�" /></td>
            </tr>
          </table>
          
      </form>
      <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/user.ico" alt="�û�ҳ��" />�û�ҳ��</a>
            </td>
          </tr>
      </table>
    </div>
  </body>
</html>
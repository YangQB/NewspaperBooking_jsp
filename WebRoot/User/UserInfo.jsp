<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>������Ϣ</title>
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
                        alert("�鿴������Ϣʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else {
         //�������ݿ�
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
         //�����ѯ��� 
         String sqls="select uid,uname,uidnum,uphone,uad,[USER].did,dname from [USER],[DEPARTMENT] where UID='"+uid+"' and [USER].did=[DEPARTMENT].did";
         //ִ�в�ѯ���
         Statement stmt = conn.createStatement();        
         ResultSet rs = stmt.executeQuery(sqls);
         //����ѯ�����Ϊ�գ����ȡ����SELECT����ѯ����ֵ
         if(rs.next())
         {
           String uname  = rs.getString(2);
           String uidnum = rs.getString(3);
           String uphone = rs.getString(4);
           String uad    = rs.getString(5);
           String did    = rs.getString(6);
           String dname  = rs.getString(7);
         
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����������Ϣ</h1><br /><br/>
      <form name="myform_4" method="post"  action="Changeinfo.jsp">
        <table class="spe">
          <tr>
            <th class="spe">�û��˺ţ�</td>
            <td class="spe"><% out.println(uid); %></td>
          </tr>
          <tr>
            <th class="spe">�û�������</th>
            <td class="spe"><% out.println(uname); %></td>
          </tr>
          <tr>
            <th class="spe">���֤�ţ�</th>
            <td class="spe"><% out.println(uidnum); %></td>
          </tr>
          <tr>
            <th class="spe">�û��绰��</th>
            <td class="spe"><% out.println(uphone); %></td>
          </tr>
          <tr>
            <th class="spe">�û���ַ��</th>
            <td class="spe"><% out.println(uad); %></td>
          </tr>
          <tr>
            <th class="spe">���ڲ��ţ�</th>
            <td class="spe"><% out.println(dname); }
                   rs.close();    
                   stmt.close();
                   conn.close();
         }         %>
            </td>
          </tr>
        </table>
        <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="�޸���Ϣ" /></td>
          </tr>
        </table>
         
        <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/user.ico" alt="�û�ҳ��" />�û�ҳ��</a>
            </td>
          </tr>
        </table>
      </form>
    </div>
  </body>
</html>
<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>Changepass_2</title>
  </head>
  <body>
    <div class="right-top">
                           �û��˺ţ� <% String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("�޸�����ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>  
    </div>
      <%
          String pass_1=(String)request.getParameter("pass_1");
          String pass_2=(String)request.getParameter("pass_2");
          String pass_3=(String)request.getParameter("pass_3");
          //�������ݿ�
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user";
          Connection conn = DriverManager.getConnection(url);
         
          //�����ѯ��� 
          String sqls="select upass from [USER] where UID='"+uid+"'";
          //ִ�в�ѯ���
          Statement stmt = conn.createStatement();        
          ResultSet rs = stmt.executeQuery(sqls);
          if(rs.next())
          {
            String upass = rs.getString(1);
            //ȷ�������Ƿ���ȷ
            if(!upass.equals(pass_1))
            {
              %>
                <Script Language="JavaScript">
                  alert("ԭ��������������������룡");
                  window.location.href="Changepass.jsp"; 
                </Script>
              <%
            }
          }
          rs.close();
          stmt.close();
          //�����޸��������
          String sqlch ="UPDATE [USER]  SET upass='"+pass_2+"' WHERE UID='"+uid+"'";
          Statement stmtch = conn.createStatement();        
          stmtch.executeUpdate(sqlch);
          stmtch.close();
          conn.close();
          }
          %>
            <Script Language="JavaScript">
              alert("�����޸ĳɹ���");
              window.location.href="User.jsp"; 
            </Script>
  </body>
</html>
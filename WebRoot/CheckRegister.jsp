<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>CheckRegister</title>
  </head>
  
  <body>
      <div>
        <%
          //��ȡ���еı���
          request.setCharacterEncoding("gb2312");
          String uid    = (String)request.getParameter("uid");
          String upass  = (String)request.getParameter("upass");
          String uname  = (String)request.getParameter("uname");
          String uidnum = (String)request.getParameter("uidnum");
          String uphone = (String)request.getParameter("uphone");
          String uad    = (String)request.getParameter("uad");
          String did    = (String)request.getParameter("did"); 
          String aid    = "admin_1";
          if(uid.equals("")||upass.equals("")||uname.equals("")||uidnum.equals("")||uphone.equals("")||uad.equals(""))
          {
            %>
              <Script Language="JavaScript">
                alert("���и������벻��Ϊ�գ����������룡");
                window.location.href="Register.html"; 
              </Script>
            <%
          }else{  
              //�������ݿ�
              //�������������Ӷ˿ڼ���Ҫ���ӵ����ݿ�����
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
              String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_reg;password=register";
              Connection conn = DriverManager.getConnection(url);
              
              //�����ѯ��� 
              String sqls="select * from [USER] where UID='"+uid+"'";
              //ִ�в�ѯ���
              Statement stmt = conn.createStatement();        
              ResultSet rs = stmt.executeQuery(sqls);
              if(rs.next())
              {
                      %>
                          <Script Language="JavaScript">
                              alert("ϵͳ�Ѵ��ڴ��û��˺ţ���ѡ������������");
                              window.location.href="Index.html"; 
                          </Script>
                      <% 
              }
              else
              {
                  //���������� 
                  String sql_in="insert [USER] values('"+uid+"','"+upass+"','"+uname+"','"+uidnum+"','"+uphone+"','"+uad+"','"+did+"','"+aid+"')";
                  //ִ�в������
                  Statement stmtin = conn.createStatement(); 
                  stmtin.executeUpdate(sql_in);
                  stmtin.close();  
                  %>
                      <Script Language="JavaScript">
                          alert("ע��ɹ������¼��");
                          window.location.href="Login.html"; 
                      </Script>
                  <%
              }
              rs.close();    
              stmt.close();
              conn.close();
          } 
        %>    
      </div>
  </body>
</html>
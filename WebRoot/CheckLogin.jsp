<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>CheckLogin</title>
  </head>
  <body>
      <div>
        <%
          //��ȡ���еı���
          String id=(String)request.getParameter("id");
          String pass=(String)request.getParameter("pass");
          String identity=(String)request.getParameter("identity");
      
          try{
              //�������ݿ�
              //�������������Ӷ˿ڼ���Ҫ���ӵ����ݿ�����
              Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
              String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook";
              
              //Ϊ��ͬ��������ò�ͬ�ĵ�¼��������
              if(identity.equals("student"))
              { 
                  //�û���ݵĵ�¼��������
                  String dbname="nb_user";
                  String dbpass="user"; 
                  Connection conn = DriverManager.getConnection(url, dbname, dbpass);
                  //�����ѯ��� 
                  String sqls="select * from [USER] where UID='"+id+"' and UPASS='"+pass+"'";
                  //ִ�в�ѯ���
                  Statement stmt = conn.createStatement();        
                  ResultSet rs = stmt.executeQuery(sqls);
                  if(null == rs)
                  {
                      //���Բ�ѯΪ��
                      System.out.println("null!");
                  }

                  //kΪ��ѯ���ļ�¼��
                  int k=0;
                  if(rs.next())    k=k+1;
     
                  //�����ѯ��¼������0����ת��User.jsp,�������»ص�����ҳ��
                  if(k>0)        
                  {  
                      session.setAttribute("uid",id);
                      response.sendRedirect("User/User.jsp");
                  } 
                  else
                  {
                      %>
                          <Script Language="JavaScript">
                              alert("�û��˺ţ��û�������û����������������µ�¼��");
                              window.location.href="Login.html"; 
                          </Script>
                      <%  
                  }
                  conn.close();
              } 
              else
              { 
                  //����Ա��ݵĵ�¼��������
                  String dbname="nb_admin";
                  String dbpass="admin"; 
                  Connection conn = DriverManager.getConnection(url, dbname, dbpass);
                  //�����ѯ��� 
                  String sqls="select * from [ADMIN] where AID='"+id+"' and APASS='"+pass+"'";
                  //ִ�в�ѯ���
                  Statement stmt = conn.createStatement();        
                  ResultSet rs = stmt.executeQuery(sqls);
                  if(null == rs)
                  {
                      //���Բ�ѯΪ��
                      System.out.println("null!");
                  }

                  //kΪ��ѯ���ļ�¼��
                  int k=0;
                  if(rs.next())    k=k+1;
     
                  //�����ѯ��¼������0����ת��Admin.jsp,�������»ص�����ҳ��
                  if(k>0)        
                  {   
                      session.setAttribute("aid",id);
                      response.sendRedirect("Admin/Admin.jsp");
                  } 
                  else
                  {
                      %>
                          <Script Language="JavaScript">
                              alert("�û��˺ţ��û�������û�������������ѡ������������");
                              window.location.href="Index.html"; 
                          </Script>
                      <%  
                  }
                  conn.close();
              }
          }catch(Exception e){
              out.println(e.toString());
          }
        %>    
      </div>
  </body>
</html>

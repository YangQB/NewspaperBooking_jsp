<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>ɾ���û�</title>
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
                        alert("ɾ���û�ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����ɾ���û�</h1><br />
        <%
          //ֻ��admin_1����Աӵ��ɾ���û���Ȩ��
          if(aid.equals("admin_1")){
            //�������ݿ�
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
            
            //ȡ����ѡ��ѡ�е�ֵ
            String result[]=request.getParameterValues("check");
            if(result!=null)
            {
                 for(int i=0;i<result.length;i++){  
                    String sql="DELETE  FROM [USER] WHERE uid='"+result[i]+"'";
                    Statement stmt = conn.createStatement();
                    stmt.executeUpdate(sql);
                    stmt.close();
                 } 
                 %>
                   <Script Language="JavaScript">
                     alert("ɾ���ɹ���");
                     window.location.href="Getuser.jsp"; 
                   </Script>
                 <%   
            }
            else{
                %>
                  <Script Language="JavaScript">
                    alert("δѡ��ɾ�����û���");
                    window.location.href="Getuser.jsp"; 
                  </Script>
                <%
            }
            conn.close();
          }else{
                %>
                    <Script Language="JavaScript">
                        alert("����ԱȨ�޲��㣬�޷�ɾ���û���Ϣ��");
                        window.location.href="Admin.jsp"; 
                    </Script>
                    
                <%
          }
          }
	 	  %>
    </div>
  </body>
</html>
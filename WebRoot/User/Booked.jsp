<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>���ı���</title>
  </head>
  
  <body>
      <div class="right-top">
                    �û��˺ţ�
      <% String uid = (String)session.getAttribute("uid");
         String nid = (String)session.getAttribute("nid");
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("���ı���ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else if(nid==null){
             %>
                 <Script Language="JavaScript">
                        alert("����ʧ�ܡ�δѡ�б���������ѡ����Ҫ���ĵı�����");
                        window.location.href="Newsp_u"; 
                 </Script>
             <%
         }else{    
         int nnum   = new Integer(session.getAttribute("nnum").toString()).intValue();
         int bct    = new Integer(request.getParameter("bct")).intValue();
         int bmonth = new Integer(request.getParameter("bmonth")).intValue();
         out.println(nnum);
         //�������ݿ�
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
         //�����ѯ��� 
         String sql_1="SELECT MAX(BID) FROM [BOOKING]";
         //ִ�в�ѯ���
         Statement stmt_1 = conn.createStatement();        
         ResultSet rs_1 = stmt_1.executeQuery(sql_1);
         if(rs_1.next()) { 
             int bid = rs_1.getInt(1);
             bid++;
             String sql_2 = "INSERT [BOOKING] VALUES('"+bid+"','"+uid+"','"+nid+"','"+bct+"','"+bmonth+"')";
             Statement stmt_2 = conn.createStatement();        
             int rs_2 = stmt_2.executeUpdate(sql_2);
             //NEWPAPER���пɶ�������һ
             int new_num = nnum - bct  ;
             String sql_3 = "UPDATE [NEWSPAPER] SET NNUM = '"+new_num+"'WHERE NID = '"+nid+"' " ;
             Statement stmt_3 = conn.createStatement();        
             stmt_3.executeUpdate(sql_3);
             stmt_3.close();
             if(rs_2 > 0)
             { %>
                  <Script Language="JavaScript">
                      alert("���ĳɹ��ɹ������ض�����Ϣ��");
                      window.location.href="Bookinfo_u.jsp"; 
                  </Script>
               <%
               
             }
             stmt_2.close();  
         }else{
              %>
                  <Script Language="JavaScript">
                      alert("���ҳ���");
                      window.location.href="Booking.jsp"; 
                  </Script>
              <%
         }
         rs_1.close();
         stmt_1.close();
         conn.close();
         }
         session.removeAttribute("nid");
         session.removeAttribute("nnum");
      %>   
      </div>
  </body>
</html>
<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>CheckAdd</title>
  </head>
  
  <body>
      <div class="right-top">
                                 ����Ա�˺ţ�
      <% 
          String aid=(String)session.getAttribute("aid");
          out.println(aid);
          if(aid==null)
          {
             %>
                 <Script Language="JavaScript">
                        alert("��ӱ���ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
          }else if(aid.equals("admin_2")){
          //��ȡ���еı���
          request.setCharacterEncoding("gb2312");
          String nid   = (String)request.getParameter("nid");
          String nname = (String)request.getParameter("nname");
          String nps   = (String)request.getParameter("nps");
          int npd      = new Integer(request.getParameter("npd")).intValue();
          int nct      = new Integer(request.getParameter("nct")).intValue();
          String npr   = (String)request.getParameter("npr");
          int nnum     = new Integer(request.getParameter("nnum")).intValue();
          String sid   = (String)request.getParameter("sid"); 
      
          //�������ݿ�
          //�������������Ӷ˿ڼ���Ҫ���ӵ����ݿ�����
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin";
          Connection conn = DriverManager.getConnection(url);
              
          //�����ѯ��� 
          String sqls="select * from [NEWSPAPER] where NID='"+nid+"'";
          //ִ�в�ѯ���
          Statement stmt = conn.createStatement();        
          ResultSet rs   = stmt.executeQuery(sqls);
          if(rs.next())  
            {
              %>
                <Script Language="JavaScript">
                alert("ϵͳ�Ѵ�������ı����ţ�������������Ϣ����");
                window.location.href="Addnewsp.jsp"; 
              </Script>
              <%
            }  
          else
          {
            //���������� 
            String sql_in="INSERT [NEWSPAPER] VALUES('"+nname+"','"+nid+"','"+nps+"','"+npd+"','"+nct+"','"+npr+"','"+nnum+"','"+sid+"','"+aid+"')";
            //ִ�в������
            Statement stmtin = conn.createStatement(); 
            stmtin.executeUpdate(sql_in);
            stmtin.close();  
            %>
              <Script Language="JavaScript">
                alert("��ӳɹ���");
                window.location.href="Newsp_a.jsp"; 
              </Script>
            <%
          }
          rs.close();    
          stmt.close();
          conn.close();
          }else{
                %>
                    <Script Language="JavaScript">
                        alert("����ԱȨ�޲��㣬�޷���ӱ�����");
                        window.location.href="Admin.jsp"; 
                    </Script>
                    
                <%
            }
          
          
      %>    
      </div>
  </body>
</html>
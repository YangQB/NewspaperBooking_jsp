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
                               �û��˺ţ� 
        <% 
          String uid=(String)session.getAttribute("uid");
          out.println(uid);
         
          //�������ݿ�
          //�������������Ӷ˿ڼ���Ҫ���ӵ����ݿ�����
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
          String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user";
          Connection conn = DriverManager.getConnection(url);
          
          //�����ѯ��� 
          String sqls="select uid,uname,uidnum,uphone,uad,[USER].did,dname from [USER],[DEPARTMENT] where UID='"+uid+"' and [USER].did=[DEPARTMENT].did";
          //ִ�в�ѯ���
          Statement stmt = conn.createStatement();        
          ResultSet rs = stmt.executeQuery(sqls);
          if(rs.next())
          {
            //��ȡ��ǰ�û�����Ϣ
            String uname_1  = rs.getString(2);
            String uidnum_1 = rs.getString(3);
            String uphone_1 = rs.getString(4);
            String uad_1    = rs.getString(5);
            String did_1    = rs.getString(6);
            
            //��ȡ�������������
            request.setCharacterEncoding("gb2312");
            String uname  = (String)request.getParameter("uname");
            String uidnum = (String)request.getParameter("uidnum");
            String uphone = (String)request.getParameter("uphone");
            String uad    = (String)request.getParameter("uad");
            String did    = (String)request.getParameter("did"); 
            
            //��֤�����Ƿ��������ݣ��������������ݣ���ԭ�����ݲ��޸�
            if(uname=="" ||uname.equals(null))    uname  = uname_1;
            if(uidnum==""||uidnum.equals(null))   uidnum = uidnum_1;
            if(uphone==""||uphone.equals(null))   uphone = uphone_1;
            if(uad==""   ||uad.equals(null))      uad    = uad_1;
            if(did==""   ||did.equals(null))      did    = did_1;
            
            //���������� 
            String sqlup="UPDATE [USER] SET  uname='"+uname+"',uidnum='"+uidnum+"',uphone='"+uphone+"',uad='"+uad+"',did='"+did+"' WHERE uid='"+uid+"'";
            //ִ�в������
            Statement stmtup = conn.createStatement(); 
            stmtup.executeUpdate(sqlup);
            stmtup.close();
          }
          //����ǰ���û���¼��������Ҳ����û�
          else{
            %>
              <Script Language="JavaScript">
                alert("�Ҳ����û��������µ�¼��");
                window.location.href="../Login.html";
              </Script>
            <%
          }
          stmt.close();
          rs.close();
          conn.close(); 
        %>
        <Script Language="JavaScript">
            alert("�޸ĳɹ���");
            window.location.href="UserInfo.jsp";
        </Script>
            
      </div>
  </body>
</html>
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
                        alert("�鿴ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else {
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����������Ϣ</h1><br />
        <table class="spe">
          <tr>
            <th class="spe" colspan="5">�û��˺ţ�<% out.println(uid); %></th>
          </tr>
          <tr>
            <th class="spe">�������</th>
            <th class="spe">������</th>
            <th class="spe">��������</th>
            <th class="spe">���ķ���</th>
            <th class="spe">��������</th>
          </tr>
          <tr>
          <%
            //�������ݿ�
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //�����ѯ��� 
            String sqls="SELECT BID,[BOOKING].NID,NNAME,BCT,BMONTH FROM [BOOKING],[USER],[NEWSPAPER] WHERE [USER].UID=[BOOKING].UID AND [NEWSPAPER].NID=[BOOKING].NID AND [USER].UID='"+uid+"'";
            //ִ�в�ѯ���
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//��rs.next()�ܻ�ò�ѯ�����ѭ�������ѯ�����û���Ϣ
		 	for(int i=1;rs.next();i++)
			{
	 		    //ȡ��SELECT����ѯ���Ľ��
	 		    String bid    = rs.getString(1);
	 		    String nid    = rs.getString(2);
	 		    String nname  = rs.getString(3);
                String bct    = rs.getString(4);
                String bmonth = rs.getString(5);
                //�����ѯ���
	 		    out.print("<td class='spe'>"+bid+"</td>");
	 		    out.print("<td class='spe'>"+nid+"</td>");
	 		    out.print("<td class='spe'>"+nname+"</td>");
	 		    out.print("<td class='spe'>"+bct+"</td>");
	 		    out.print("<td class='spe'>"+bmonth+"</td>");
	 		    out.print("</tr>");
	 		
	 	    }
	 	    out.print("</table>");
	 	    rs.close();
	 	    stmt.close();
	 	    conn.close();
	 	    }
	 	  %>
	      </tr>
	   </table><br/><br/>
      <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/admin.ico" alt="�û�ҳ��" />�û�ҳ��</a>
            </td>
            <td>
            </td>
          </tr>
      </table>
    </div>
   
  </body>
</html>
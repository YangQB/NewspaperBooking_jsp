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
      <% String aid=(String)session.getAttribute("aid");
         out.println(aid);
         if(aid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("�鿴������Ϣʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����������Ϣ</h1><br />
        <table class="spe">
          <tr>
            <th class="spe">�������</th>
            <th class="spe">�û��˺�</th>
            <th class="spe">������</th>
            <th class="spe">��������</th>
            <th class="spe">���ķ���</th>
            <th class="spe">��������</th>
          </tr>
          <tr>
          <%
            //�������ݿ�
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //�����ѯ��� 
            String sqls="SELECT BID,[BOOKING].UID,[BOOKING].NID,NNAME,BCT,BMONTH FROM [BOOKING],[USER],[NEWSPAPER] WHERE [USER].UID=[BOOKING].UID AND [NEWSPAPER].NID=[BOOKING].NID";
            //ִ�в�ѯ���
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//��rs.next()�ܻ�ò�ѯ�����ѭ�������ѯ�����û���Ϣ
		 	for(int i=1;rs.next();i++)
			{
	 		    //ȡ��SELECT����ѯ���Ľ��
	 		    String bid    = rs.getString(1);
	 		    String uid    = rs.getString(2);
	 		    String nid    = rs.getString(3);
	 		    String nname  = rs.getString(4);
                String bct    = rs.getString(5);
                String bmonth = rs.getString(6);
                //�����ѯ���
	 		    out.print("<td class='spe'>"+bid+"</td>");
	 		    out.print("<td class='spe'>"+uid+"</td>");
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
              <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="����Աҳ��" />����Աҳ��</a>
            </td>
            <td>
            </td>
          </tr>
      </table>
    </div>
   
  </body>
</html>
<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>�û���Ϣ</title>
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
                        alert("�鿴�û���Ϣʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ�����û���Ϣ</h1><br />
      <h3>��ѡ�û���Ϣ��ѡ����ɾ����Ӧ�û�</h3>
      <form name="myform_6" method="post"   action="Deluser.jsp">
        <table class="spe">
          <tr>
            <th class="spe">ѡ��</th>
            <th class="spe">���</th>
            <th class="spe">�û��˺�</th>
            <th class="spe">�û�����</th>
            <th class="spe">���֤��</th>
            <th class="spe">�û��绰</th>
            <th class="spe">�û���ַ</th>
            <th class="spe">���ڲ���</th>
          </tr>
          <tr>
          <%
            //�������ݿ�
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //�����ѯ��� 
            String sqls="select uid,uname,uidnum,uphone,uad,[USER].did,dname from [USER],[DEPARTMENT] where [USER].did=[DEPARTMENT].did";
            //ִ�в�ѯ���
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//��rs.next()�ܻ�ò�ѯ�����ѭ�������ѯ�����û���Ϣ
		 	for(int i=1;rs.next();i++)
			{
	 		    //ȡ��SELECT����ѯ���Ľ��
	 		    String uid    = rs.getString(1);
	 		    String uname  = rs.getString(2);
                String uidnum = rs.getString(3);
                String uphone = rs.getString(4);
                String uad    = rs.getString(5);
                String dname  = rs.getString(7);
                //�����ѯ���
	 		    out.print("<td class='spe'><input type=checkbox name=check value="+uid+"></td>");
	 		    out.print("<td class='spe'>"+i+"</td>");
	 		    out.print("<td class='spe'>"+uid+"</td>");
	 		    out.print("<td class='spe'>"+uname+"</td>");
	 		    out.print("<td class='spe'>"+uidnum+"</td>");
	 		    out.print("<td class='spe'>"+uphone+"</td>");
	 		    out.print("<td class='spe'>"+uad+"</td>");
	 	     	out.print("<td class='spe'>"+dname+"</td>");
	 		    out.print("</tr>");
	 		}
	 	    out.print("</table>");
	 	    rs.close();
	 	    stmt.close();
	 	    conn.close();
	 	    }
	 	  %>
	      </tr>
	   </table>
	   <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="ɾ���û�" /></td>
          </tr>
        </table>
      </form>
      <table>
          <tr>
            <td>
              <a href="Admin.jsp"><img class="small" src="../pics/admin.ico" alt="����Աҳ��" />����Աҳ��</a>
            </td>
          </tr>
      </table>
    </div>
   
  </body>
</html>
<%@ page import="java.lang.*, java.io.*, java.sql.*, java.util.*"
    contentType="text/html;charset=gb2312" language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html;charset=gb2312"%> 
<!DOCTYPE HTML>
<html>
  <head>
    <link rel="Shortcut Icon" type="image/x-icon" href="../pics/title.ico" />
    <link rel="stylesheet" type="text/css" href="../style/nb.css" />
    <meta http-equiv="content-type" content="text/html; charset=gb2312">
    <title>ͳ����Ϣ</title>
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
                        alert("�鿴ͳ����Ϣʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
         //�������ݿ�
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_admin;password=admin;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����ͳ����Ϣ</h1><br />
        <table class="spe">
          <tr>
            <th class="spe" colspan="2">���Ŷ���ͳ��</th>
          </tr>
          <tr>
            <th class="spe">��������</th>
            <th class="spe">���ķ���</th>
          </tr>
          <tr>
          <%
             //�����ѯ��� 
             String sql_1="SELECT [��������],[��������] FROM [ST_DEP]";
             //ִ�в�ѯ���
             Statement stmt_1 = conn.createStatement();        
             ResultSet rs_1 = stmt_1.executeQuery(sql_1);
             //��rs.next()�ܻ�ò�ѯ�����ѭ�������ѯ�����û���Ϣ
		 	 for(int i=1;rs_1.next();i++)
			 {
	 		    //ȡ��SELECT����ѯ���Ľ��
	 		    String dp_name = rs_1.getString(1);
	 		    String count_1 = rs_1.getString(2);
                //�����ѯ���
	 		    out.print("<td class='spe'>"+dp_name+"</td>");
	 		    out.print("<td class='spe'>"+count_1+"</td>");
	 		    out.print("</tr>");
	 		
	 	     }
	 	     out.print("</table>");
	 	     rs_1.close();
	 	     stmt_1.close();
	 	  %>
	      </tr>
        </table><br/><br/>
	   <table class="spe">
	      <tr>
            <th class="spe" colspan="2">�������ඩ��ͳ��</th>
          </tr>
          <tr>
            <th class="spe">��������</th>
            <th class="spe">���ķ���</th>
          </tr>
          <tr>
          <%
             //�����ѯ��� 
             String sql_2="SELECT [�������],[��������] FROM [ST_NSP]";
             //ִ�в�ѯ���
             Statement stmt_2 = conn.createStatement();        
             ResultSet rs_2 = stmt_2.executeQuery(sql_2);
             //��rs.next()�ܻ�ò�ѯ�����ѭ�������ѯ�����û���Ϣ
		 	 for(int i=1;rs_2.next();i++)
			 {
	 		    //ȡ��SELECT����ѯ���Ľ��
	 		    String st_name = rs_2.getString(1);
	 		    String count_2 = rs_2.getString(2);
                //�����ѯ���
	 		    out.print("<td class='spe'>"+st_name+"</td>");
	 		    out.print("<td class='spe'>"+count_2+"</td>");
	 		    out.print("</tr>");
	 		
	 	     }
	 	     out.print("</table>");
	 	     rs_2.close();
	 	     stmt_2.close();
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
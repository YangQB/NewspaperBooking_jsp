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
                        alert("�鿴����ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ����������Ϣ</h1><br />
      <h3>��ѡ�û���Ϣ��ѡ����ɾ����Ӧ������ÿ��ֻ�ܶ���һ�ֱ�����</h3>
      <form name="myform_8" method="post"  onsubmit="return checkinput(this);" action="Booking.jsp">
        <table class="spe">
          <tr>
            <th class="spe">ѡ��</th>
            <th class="spe">���</th>
            <th class="spe">������</th>
            <th class="spe">��������</th>
            <th class="spe">���汨��</th>
            <th class="spe">��������</th>
            <th class="spe">���ȱ���</th>
            <th class="spe">���ݽ���</th>
            <th class="spe">�ɶ�����</th>
            <th class="spe">��������</th>
          </tr>
          <tr>
          <%
            //�������ݿ�
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
            String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
            Connection conn = DriverManager.getConnection(url);
         
            //�����ѯ��� 
            String sqls="SELECT NID,NNAME,NPS,NPD,NCT,NPR,NNUM,SNAME FROM [NEWSPAPER],[SORT] WHERE [NEWSPAPER].SID=[SORT].SID";
            //ִ�в�ѯ���
            Statement stmt = conn.createStatement();        
            ResultSet rs = stmt.executeQuery(sqls);
            
		 	//��rs.next()�ܻ�ò�ѯ�����ѭ�������ѯ�����û���Ϣ
		 	for(int i=1;rs.next();i++)
			{
	 		    //ȡ��SELECT����ѯ���Ľ��
	 		    String nid    = rs.getString(1);
	 		    String nname  = rs.getString(2);
                String nps    = rs.getString(3);
                String npd    = rs.getString(4);
                String nct    = rs.getString(5);
                String npr    = rs.getString(6);
                String nnum   = rs.getString(7);
                String sname  = rs.getString(8);
                //�����ѯ���
	 		    out.print("<td class='spe'><input type='radio' name='choice' value="+nid+"></td>");
	 		    out.print("<td class='spe'>"+i+"</td>");
	 		    out.print("<td class='spe'>"+nid+"</td>");
	 		    out.print("<td class='spe'>"+nname+"</td>");
	 		    out.print("<td class='spe'>"+nps+"</td>");
	 		    out.print("<td class='spe'>"+npd+"</td>");
	 		    out.print("<td class='spe'>"+nct+"</td>");
	 	     	out.print("<td class='spe'>"+npr+"</td>");
	 	     	out.print("<td class='spe'>"+nnum+"</td>");
	 	     	out.print("<td class='spe'>"+sname+"</td>");
	 		    out.print("</tr>");
	 		}
	 	    out.print("</table>");
	 	    rs.close();
	 	    stmt.close();
	 	    conn.close();
	 	  %>
	      </tr>
	   </table>
	   <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="���ı���" /></td>
          </tr>
        </table>
      </form>
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
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
      <% String uid=(String)session.getAttribute("uid");
         out.println(uid);
         if(uid==null)
         {
             %>
                 <Script Language="JavaScript">
                        alert("����ʧ�ܡ�δ��¼ϵͳ�����ȵ�¼��");
                        window.location.href="../Login.html"; 
                 </Script>
             <%
         }else{
         String nid = (String)request.getParameter("choice");
         session.setAttribute("nid",nid);
         //�������ݿ�
         Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver").newInstance();
         String url="jdbc:sqlserver://localhost:1433;DatabaseName=NewspaperBook;user=nb_user;password=user;useUnicode=true;characterEncoding=GB2312";
         Connection conn = DriverManager.getConnection(url);
         
         //�����ѯ��� 
         String sql="SELECT NNAME,NNUM FROM [NEWSPAPER] WHERE NID='"+nid+"'";
         //ִ�в�ѯ���
         Statement stmt = conn.createStatement();        
         ResultSet rs = stmt.executeQuery(sql);
         //����ѯ�����Ϊ�գ����ȡ����SELECT����ѯ����ֵ
         if(rs.next())
         {
             String nname = rs.getString(1);
             int nnum     = rs.getInt(2);
             session.setAttribute("nnum",nnum);
      %>   
    </div>
    <div>
      <h1>�������Ĺ���ϵͳ�������ı���</h1><br />
      <form name="myform_7" method="post" onsubmit="return checkinput(this);" action="Booked.jsp">
        <table class="spe">
          <tr>
            <th class="spe">�û��˺ţ�</th>
            <td class="spe"><% out.println(uid); %></td>
          </tr>
          <tr>
            <th class="spe">�����ţ�</th>
            <td class="spe"><% out.println(nid); %></td>
          </tr>
          <tr>
            <th class="spe">�������ƣ�</th>
            <td class="spe"><% out.println(nname); %></td>
          </tr>
          <tr>
            <th class="spe">�ɶ�������</th>
            <td class="spe"><% out.println(nnum); %></td>
          </tr>
          <tr>
            <th class="spe">���������</th>
            <td class="spe"><input type="text" name="bct" maxlength="3"/></td>
          </tr>
          <tr>
            <th class="spe">����������</th>
            <td class="spe"><input type="text" name="bmonth" maxlength="3"/></td>
          </tr>
        </table>
        
        <table>
          <tr>
            <td></td>
            <td><input type="submit" name="submit" value="ȷ�϶���" /></td>
          </tr>
        </table>                        
      </form>
      <%
            if(nnum<=0){
              %>
                  <Script Language="JavaScript">
                      alert("����ʧ�ܡ�����ʣ���������㣬�뷵�أ�");
                      window.location.href="Newsp_u.jsp"; 
                  </Script>
              <%
            }
          } 
         else
         {
      %>
         <Script Language="JavaScript">
                alert("����ʧ�ܡ�δѡ�񱨿���������ѡ��");
                window.location.href="Newsp_u.jsp"; 
         </Script><%
         rs.close();
         stmt.close();
         conn.close();
         }
      }%>
      <table>
          <tr>
            <td>
              <a href="User.jsp"><img class="small" src="../pics/admin.ico" alt="�û�ҳ��" />�û�ҳ��</a>
            </td>
            <td>
              <a href="Newsp_u.jsp"><img class="small" src="../pics/newsp.ico" alt="�鿴����" />�鿴����</a>
            </td>
          </tr>
      </table>
    </div>
  </body>
</html>